# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gnome-rtfm
pkgver=0.3.1
pkgrel=1
pkgdesc="Offline documentation browser, dash docset reader"
arch=("x86_64")
url="https://github.com/hugopl/rtfm"
license=("MIT")
depends=("gc" "libevent" "pcre" "libadwaita>=1:1.3.3" "sqlite" "webkitgtk-6.0")
makedepends=("make" "crystal>=1.11.1" "shards>=0.14.0" "unzip" "gtk4-docs" "pango-docs" "libadwaita-docs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/rtfm/archive/v${pkgver}.tar.gz")
sha256sums=('2a6385d248fd4a933bb657cef746715e3fb67731b8ef4edfe5235383dd7bc13f')

build() {
  cd "rtfm-$pkgver"
  shards install
  ./bin/gi-crystal
  make
}

package() {
  cd "rtfm-$pkgver"
  make install DESTDIR="${pkgdir}"
}
