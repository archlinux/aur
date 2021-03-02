# Maintainer: Rui Ventura <rventura.pt@outlook.com>
pkgname=chiaki
pkgver=2.1.1
pkgrel=2
pkgdesc="Free and Open Source PS4 Remote Play Client"
arch=(x86_64)
url=https://git.sr.ht/~thestr4ng3r/chiaki
license=(AGPL3)
provides=(chiaki)
depends=(ffmpeg gcc-libs qt5-multimedia qt5-svg opus "openssl>=1.1" sdl2)
makedepends=(cmake protobuf python-protobuf)
source=("$url/refs/download/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
sha256sums=('75115a19f197d19fc417e863583681e95e412364427aa394f2c0eded54343710')

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" -j$nproc install
}
