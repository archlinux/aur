pkgname=cmake-converter
_pkgname=cmakeconverter
pkgver=2.1.0
pkgrel=1
pkgdesc='This project aims to facilitate the conversion of Visual Studio solution to CMake projects.'
url='https://github.com/pavelliavonau/cmakeconverter'
arch=('any')
license=('AGPL3')
depends=('python' 'python-colorama' 'python-lxml')
makedepends=('python-setuptools')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/pavelliavonau/cmakeconverter/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('19ce085ee9840f34529eac8228a59e4207992f3df55f737bb7c19d4eca6d288e50d83d3a4e596b13bc76923ab16b9cd5e18cc2dfa90f89eecdc631833cbc1bda')

build() {
  (
    cd ${_pkgname}-$pkgver
    python setup.py build
  )
}

check() {
  (
    cd ${_pkgname}-$pkgver
    python -B setup.py test
  )
}

package() {
  cd ${_pkgname}-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
