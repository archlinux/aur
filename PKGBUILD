# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gnome-rtfm
pkgver=0.2.2
pkgrel=1
pkgdesc="Offline documentation browser, dash docset reader"
arch=("x86_64")
url="https://github.com/hugopl/rtfm"
license=("MIT")
depends=("gc" "libevent" "pcre" "libadwaita>=1:1.3.3" "sqlite" "webkitgtk-6.0")
makedepends=("make" "crystal>=1.8.2" "shards>=0.14.0" "unzip" "gtk4-docs" "pango-docs" "libadwaita-docs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/rtfm/archive/v${pkgver}.tar.gz")
sha256sums=('dd887c8f5f3dd0bc567a58cbe6edca3647e86966e52f4a6cc70cef436e8e1bf1')

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
