# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-rgb565-converter
_name=${pkgname#python-}

pkgver=1.3.2
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
sha256sums=('bc4f7da6508a85c1035379aa75768624b37a30281588e0f1acf97c746c5d24e9')

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
