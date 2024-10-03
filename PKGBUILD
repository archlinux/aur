# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-rgb565-converter
_name=${pkgname#python-}

pkgver=1.3.3
pkgrel=1
pkgdesc="Python script to convert images into rgb565 as required by some tft libraries"

arch=('any')
url="https://github.com/CommanderRedYT/rgb565-converter"
license=('MIT')

depends=('python')
makedepends=('python-setuptools')

source=(
  "https://github.com/CommanderRedYT/rgb565-converter/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('b6667b4e742022e41df11e7b1554d198356c13257e868f97233e12a154212e4c')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

# check() {
#   cd $_name-$pkgver
# 
#   python setup.py pytest
# }

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
