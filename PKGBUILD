# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gnome-rtfm
pkgver=0.0.1
pkgrel=1
pkgdesc="Offline documentation browser, dash docset reader"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/rtfm"
license=("MIT")
depends=("gc" "libevent" "pcre" "libadwaita>=1:1.3.3" "sqlite" "webkit2gtk-5.0")
makedepends=("make" "crystal>=1.8.2" "shards>=0.14.0" "unzip")
source=("rtfm-main.zip::https://github.com/hugopl/rtfm/archive/refs/heads/main.zip")
sha256sums=('b952852454af9afc59b2acccc72c07e9a81072781f7d853ef9720d582c1e25e9')

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
