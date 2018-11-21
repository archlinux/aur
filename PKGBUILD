# Maintainer: Maxime Schmitt <maxime.schmitt91@gmail.com>

pkgname=nvtop
pkgver=0.3.0
pkgrel=1
pkgdesc="An htop like monitoring tool for NVIDIA GPUs"
arch=('x86_64')
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('nvidia-utils' 'ncurses')
makedepends=('cmake' 'cuda')
source=("https://github.com/Syllo/nvtop/archive/$pkgver.tar.gz")
sha256sums=('9b91ed2cf99035e90335078d425d6914b4f758dee7644fc9e91dcd01bbbbf104')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
