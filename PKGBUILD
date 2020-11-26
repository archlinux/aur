# Maintainer: jxir <aur@jxir.de>

pkgname=qv
pkgver=4.0
pkgrel=1
pkgdesc="Quick Viewer for 2D data (images, renderings, sensor data, ...)"
arch=('x86_64')
url="https://marlam.de/qv/"
license=('MIT')
depends=('tad' 'qt5-base')
makedepends=('cmake')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('a673c2119a55a8202add54b87b680ebdea9270f255f55589a7c69bc598d784ce')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
