# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: vanyasem
# Contributor: Florian Wittmann

_pkgname='pathvalidate'
pkgname="python-${_pkgname}"
pkgver=2.3.1
pkgrel=1
pkgdesc='Sanitize/validate strings in filenames/file-paths/etc'
arch=('any')
url='https://github.com/thombashi/pathvalidate'
_url_pypi='https://pypi.org/project/pathvalidate'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1be91f23dd1fb5002ad2b52cb4e7396deb56092ef29a7facb6e4032c5a444f8a')

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
