# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=yuediff
pkgver=0.2.0
pkgrel=1
pkgdesc="List differences between sets of Firefox config files. This tool was used to compare different librewolf.cfg and user.js files."
arch=("x86_64")
url="https://gitlab.com/stanzabird/yuediff"
license=("MPL2")
source=("https://gitlab.com/stanzabird/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=("497c15088898748fdbbab9564a7bfa66098ad5864bfb0a002b4e9835262d9eda")

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
