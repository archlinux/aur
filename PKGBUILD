# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric Bailey <nerflad@gmail.com>

pkgname=nyan-lang
pkgver=0.3
pkgrel=1
pkgdesc="A data description language designed for openage"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://github.com/SFTtech/nyan"
license=(LGPL3)
depends=(glibc gcc-libs)
makedepends=(cmake git)
source=("nyan-lang::git+https://github.com/SFTtech/nyan.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cmake -B build -S "nyan-lang" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
