# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=edges
pkgver=2.0.1
pkgrel=2
pkgdesc="Command-line tool to set up hot-corners"
arch=(x86_64)
url="https://github.com/arisinfenix/edges"
license=(GPL3)
depends=(libx11 libxi libxrandr)
makedepends=(libxfixes)
source=("https://github.com/arisinfenix/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fd8b3bc9909e0f896f4f0cf4a8c364f757eb18580dfe496033455812810dbc365dc1475f02f80646a68172fda9541557d9d1e3ba4616d66560f1f42fc8fd39ed')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
