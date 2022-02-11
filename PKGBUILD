# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=yuediff
pkgver=0.2.0
pkgrel=1
pkgdesc="List differences between sets of Firefox config files. This tool was used to compare different librewolf.cfg and user.js files."
arch=("x86_64")
url="https://gitlab.com/stanzabird/yuediff"
license=("MPL2")
source=("https://gitlab.com/stanzabird/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=("42a11e0c9f439268ec29013c4712920647095170331591080231a6e7389bbf13")

build() {
  cd $pkgname-v$pkgver
  autoreconf -if
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR=$pkgdir/ install
}
