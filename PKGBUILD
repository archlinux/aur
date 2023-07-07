# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gnome-rtfm
pkgver=0.1.0
pkgrel=1
pkgdesc="Offline documentation browser, dash docset reader"
arch=("x86_64")
url="https://github.com/hugopl/rtfm"
license=("MIT")
depends=("gc" "libevent" "pcre" "libadwaita>=1:1.3.3" "sqlite" "webkitgtk-6.0")
makedepends=("make" "crystal>=1.8.2" "shards>=0.14.0" "unzip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/rtfm/archive/v${pkgver}.tar.gz")
sha256sums=('b4cf139e51de5510fd43a6bb38d9346c78a7f24398e4a9977885967f1eabe065')

build() {
  cd "$srcdir/rtfm-$pkgver"
  shards install
  ./bin/gi-crystal
  make
}

package() {
  cd "$srcdir/rtfm-$pkgver"
  make install DESTDIR="${pkgdir}"
}
