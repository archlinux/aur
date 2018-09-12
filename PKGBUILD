# Maintainer: Maxime Schmitt <maxime.schmitt91@gmail.com>

pkgname=nvtop
pkgver=0.2.3
pkgrel=3
pkgdesc="An htop like monitoring tool for NVIDIA GPUs"
arch=('x86_64')
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('nvidia-utils' 'ncurses')
makedepends=('cmake' 'cuda')
source=("https://github.com/Syllo/nvtop/archive/$pkgver.tar.gz")
sha256sums=('1b5db62c1a204ac83864c50c6dd68c2875ba9f81e32ac38c24286285299354e7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
