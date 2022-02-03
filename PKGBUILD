# Maintainer: jxir <aur@jxir.de>

pkgname=qv
pkgver=4.4
pkgrel=1
pkgdesc="Quick Viewer for 2D data (images, renderings, sensor data, ...)"
arch=('x86_64')
url="https://marlam.de/qv/"
license=('MIT')
depends=('tad' 'qt5-base')
makedepends=('cmake')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('cb27779bd606ff208945c5c0e8a40f23aac8bebadc21ce334e380aa8aca0e8a7')

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
