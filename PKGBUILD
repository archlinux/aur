# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric Bailey <nerflad@gmail.com>

pkgname=nyan-lang
pkgver=0.3.1
pkgrel=1
pkgdesc="A data description language designed for openage"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://github.com/SFTtech/nyan"
license=(LGPL-3.0-or-later)
depends=(glibc gcc-libs)
makedepends=(cmake git)
source=("nyan-lang::git+https://github.com/SFTtech/nyan.git#tag=v${pkgver}")
sha256sums=('701f21669661fb4af08b114d027ac016d137c2af1c81da440b3d147beaf01a6c')

build() {
  cmake -B build -S "nyan-lang" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
