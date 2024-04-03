# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gnome-rtfm
pkgver=0.4.1
pkgrel=1
pkgdesc="Offline documentation browser, dash docset reader"
arch=("x86_64")
url="https://github.com/hugopl/rtfm"
license=("MIT")
depends=("gc" "libevent" "pcre2" "libadwaita>=1:1.5.0" "sqlite>=3.45.2" "webkitgtk-6.0>=2.44.0")
makedepends=("make" "crystal>=1.11.1" "shards>=0.14.0" "unzip" "gtk4-docs" "pango-docs" "libadwaita-docs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/rtfm/archive/v${pkgver}.tar.gz")
sha256sums=('301e4e2fdbd3848aac723ab8611d11a6c69a02013d9e5aeaa211471fcf3a5066')

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
