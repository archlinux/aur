# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gnome-rtfm
pkgver=0.6.0
pkgrel=1
pkgdesc="Offline documentation browser, dash docset reader"
arch=("x86_64")
url="https://github.com/hugopl/rtfm"
license=("MIT")
depends=("gc" "libevent" "libyaml>=0.2.5" "pcre2" "libadwaita>=1:1.5.0" "sqlite>=3.45.2" "webkitgtk-6.0>=2.44.0")
makedepends=("make" "crystal>=1.11.1" "shards>=0.14.0" "unzip" "gtk4-docs" "pango-docs" "libadwaita-docs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/rtfm/archive/v${pkgver}.tar.gz")
sha256sums=('5d37b72b9fa0d44b855926b17fe53daa91c71ecd02b6028febae010973ab0d40')

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
