pkgname=cmake-converter
_pkgname=cmakeconverter
pkgver=2.2.0
pkgrel=1
pkgdesc='This project aims to facilitate the conversion of Visual Studio solution to CMake projects.'
url='https://github.com/pavelliavonau/cmakeconverter'
arch=('any')
license=('AGPL3')
depends=('python' 'python-colorama' 'python-lxml')
makedepends=('python-setuptools')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/pavelliavonau/cmakeconverter/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('9b34337be3582b2d5243247554849774ad711100a5c3fbb4ac563df3074ecd8d3cfd8a58c3535cfaf3f52cee8514cca62073da6739c8315e82beeff7418dd28c')

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
