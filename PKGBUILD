# Maintainer: FishHawk <whang23@outlook.com>

pkgname=fez-dot
_pkgname=FezDot
pkgver=0.1.1
pkgrel=3
pkgdesc="A rotating translucent four dimensions hypercube"
arch=('x86_64')
url="https://github.com/FishHawk/FezDot"
license=('GPL')
depends=('qt5-quickcontrols2')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FishHawk/FezDot/archive/$pkgver.tar.gz")
sha256sums=('4d46d97a703d0e735c02b980f050160323c54f7a688c7ff5e3c27fe8cdf95c4b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  cd build
  make DESTDIR="$pkgdir" install
}