# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='namestand'
pkgname="python-${_pkgname}"
pkgver=0.1.1
pkgrel=2
pkgdesc='Standardize any list of strings, but especially database/CSV column-names'
arch=('any')
url='https://github.com/buzzfeednews/namestand'
_url_pypi='https://pypi.org/project/namestand'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6a1107c4436891c2628f1dde3684689cc1d6cd5021f7e23ce324a8e885ffe6e4')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
