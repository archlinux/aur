# Maintainer: Maxime Schmitt <maxime.schmitt91@gmail.com>

pkgname=nvtop
pkgver=1.0.0
pkgrel=2
pkgdesc="An htop like monitoring tool for NVIDIA GPUs"
arch=('x86_64')
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('nvidia-utils' 'ncurses')
makedepends=('cmake' 'cuda')
source=("https://github.com/Syllo/nvtop/archive/$pkgver.tar.gz")
sha256sums=('de3d7b6a889f886f3bc28c15c3c34cfb6fcb7cb7ebc9a0cc36c3c77d837029b1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
