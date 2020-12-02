# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: vanyasem
# Contributor: Florian Wittmann

_pkgname='pathvalidate'
pkgname="python-${_pkgname}"
pkgver=2.3.0
pkgrel=2
pkgdesc='Sanitize/validate strings in filenames/file-paths/etc'
arch=('any')
url='https://github.com/thombashi/pathvalidate'
_url_pypi='https://pypi.org/project/pathvalidate'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('32d30dbacb711c16bb188b12ce7e9a46b41785f50a12f64500f747480a4b6ee3')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
