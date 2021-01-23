# Maintainer: Rui Ventura <rventura.pt@outlook.com>
pkgname=chiaki
pkgver=2.1.0
pkgrel=1
pkgdesc="Free and Open Source PS4 Remote Play Client"
arch=(x86_64)
url=https://git.sr.ht/~thestr4ng3r/chiaki
license=(AGPL3)
provides=(chiaki)
depends=(ffmpeg gcc-libs qt5-multimedia qt5-svg opus "openssl>=1.1" sdl2)
makedepends=(cmake protobuf python-protobuf)
source=("$url/refs/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
sha256sums=('920809b126163c687e39ce9e6e5628c6ac0134b4da27d0f5e75d20b2a94e69f2')

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" -j$nproc install
}
