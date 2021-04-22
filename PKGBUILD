# Maintainer: jxir <aur@jxir.de>

pkgname=qv
pkgver=4.1
pkgrel=1
pkgdesc="Quick Viewer for 2D data (images, renderings, sensor data, ...)"
arch=('x86_64')
url="https://marlam.de/qv/"
license=('MIT')
depends=('tad' 'qt5-base')
makedepends=('cmake')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('e3f8c8e04e9a52a33b7190c59687f7a2bb2d40a0a8b325d44e3bb673b0eca850')

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
