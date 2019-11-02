# Maintainer: Rui Ventura <rventura.pt@outlook.com>
pkgname=chiaki
pkgver=1.1.0
pkgrel=1
pkgdesc="Free and Open Source PS4 Remote Play Client"
arch=(x86_64)
url=https://github.com/thestr4ng3r/chiaki
license=(GPL)
provides=(chiaki)
depends=(ffmpeg gcc-libs qt5-multimedia qt5-svg opus "openssl>=1.1" sdl2)
makedepends=(cmake protobuf python-protobuf)
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
sha256sums=(ae434eb8da9f15e6ba68b38812ade9a9f22a86a2119111f18dad636bac540180)

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
}
