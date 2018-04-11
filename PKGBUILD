# Maintainer: Maxime Schmitt <maxime.schmitt91@gmail.com>

pkgname=nvtop
pkgver=0.2.2
pkgrel=1
pkgdesc="An htop like monitoring tool for NVIDIA GPUs"
arch=('x86_64')
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('nvidia-utils' 'ncurses')
makedepends=('cmake' 'cuda')
source=("https://github.com/Syllo/nvtop/archive/$pkgver.tar.gz")
sha256sums=('598e1a1f774745d8c98a4b79510f219cfc1cf80ab65a5b643bd49106dad71964')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
