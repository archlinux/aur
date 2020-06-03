# Maintainer: Rui Ventura <rventura.pt@outlook.com>
pkgname=chiaki
pkgver=1.2.1
pkgrel=1
pkgdesc="Free and Open Source PS4 Remote Play Client"
arch=(x86_64)
url=https://github.com/thestr4ng3r/chiaki
license=(GPL)
provides=(chiaki)
depends=(ffmpeg gcc-libs qt5-multimedia qt5-svg opus "openssl>=1.1" sdl2)
makedepends=(cmake protobuf python-protobuf)
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
sha256sums=('e9dd1ec89d19f065c33867329d81be302930303386e95cb64163c143dbc72327')

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" -j$nproc install
}
