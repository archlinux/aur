# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=retryrequests
pkgname=python-${_pkgname}
pkgver=0.0.3
pkgrel=1
pkgdesc='Python library for HTTP requests using requests package with exponential back-off retry'
arch=('any')
url='https://github.com/thombashi/retryrequests'
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('eddd18ea7034e2dc2a0708aa1de2aa3e611a7d423d8f40c9fcb4d63fdaa451f9')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
