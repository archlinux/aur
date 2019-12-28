# Maintainer: jxir <aur@jxir.de>

pkgname=qv
pkgver=3.0
pkgrel=1
pkgdesc="Quick Viewer for 2D data (images, renderings, sensor data, ...)"
arch=('x86_64')
url="https://marlam.de/qv/"
license=('MIT')
depends=('tad' 'qt5-base')
makedepends=('cmake')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('6bf2c05b836f2dee17ae2a116b962e9e129add83519508235545d1b2bd4bdd18')

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
