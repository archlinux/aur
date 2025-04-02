# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gnome-rtfm
pkgver=0.6.2
pkgrel=1
pkgdesc="Offline documentation browser, dash docset reader"
arch=("x86_64")
url="https://github.com/hugopl/rtfm"
license=("MIT")
depends=("gc" "libevent" "libyaml>=0.2.5" "pcre2" "libadwaita>=1:1.5.0" "sqlite>=3.45.2" "webkitgtk-6.0>=2.44.0")
makedepends=("make" "crystal>=1.11.1" "shards>=0.14.0" "unzip" "gtk4-docs" "pango-docs" "libadwaita-docs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/rtfm/archive/v${pkgver}.tar.gz")
sha256sums=('7bc371b2845e7d932e98d392e287fb389def8625fc86b052fb6f38478e6afb2d')

build() {
  cd "rtfm-$pkgver"
  make
}

package() {
  cd "rtfm-$pkgver"
  make install DESTDIR="${pkgdir}"
}
