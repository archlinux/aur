# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-rgb565-converter
_name=${pkgname#python-}

pkgver=1.3.0
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
sha256sums=('372919c7fff4f72ce960a1387a8bf9cf4894b5bb03c850f3b4e9802fa5e91596')

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
