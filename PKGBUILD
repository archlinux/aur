# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=python-rgb565-converter
_name=${pkgname#python-}

pkgver=1.4.0
pkgrel=2
pkgdesc="Python script to convert images into rgb565 as required by some tft libraries"

arch=('any')
url="https://github.com/CommanderRedYT/rgb565-converter"
license=('MIT')

depends=('python' 'python-pillow')
makedepends=('python-setuptools')

source=(
  "https://github.com/CommanderRedYT/rgb565-converter/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('51e2d96407f7db8def514c50147d406aa28a377a41594fbc156de4ac36a4f3e0')

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
