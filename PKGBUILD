# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gnome-rtfm
pkgver=0.0.1
pkgrel=2
pkgdesc="Offline documentation browser, dash docset reader"
arch=("x86_64")
url="https://github.com/hugopl/rtfm"
license=("MIT")
depends=("gc" "libevent" "pcre" "libadwaita>=1:1.3.3" "sqlite" "webkitgtk-6.0")
makedepends=("make" "crystal>=1.8.2" "shards>=0.14.0" "unzip")
source=("rtfm-main.zip::https://github.com/hugopl/rtfm/archive/refs/heads/main.zip")
sha256sums=('64b24612f0cb7d88e2c8f68e8fba27b4e5bf4407d35cea578bc2ae5dfcb96867')

build() {
  # cd "$srcdir/rtfm-$pkgver"
  cd "$srcdir/rtfm-main"
  shards install
  ./bin/gi-crystal
  make
}

package() {
  cd "$srcdir/rtfm-main"
  make install DESTDIR="${pkgdir}"
}
