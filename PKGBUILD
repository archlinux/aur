# Maintainer: Maxime Schmitt <maxime.schmitt91@gmail.com>

pkgname=nvtop
pkgver=1.0.0
pkgrel=1
pkgdesc="An htop like monitoring tool for NVIDIA GPUs"
arch=('x86_64')
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('nvidia-utils' 'ncurses')
makedepends=('cmake' 'cuda')
source=("https://github.com/Syllo/nvtop/archive/$pkgver.tar.gz")
sha256sums=('3ff90a1ded1cdb409c2eb2f0e2148e91e027c4129a6584ef6d936924c9ac730f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
