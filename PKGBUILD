# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-rgb565-converter
_name=${pkgname#python-}

pkgver=1.2.2
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
sha256sums=('84d14f766f8d536d055ad19f4aaa7f11c3d34611f0b53ac8dd019958982a9938')

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
