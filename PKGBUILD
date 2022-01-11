# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=permfix
pkgver=0.2.1
pkgrel=1
pkgdesc="Fix permissions.sqlite db to allow cookies for specified domains in Firefox."
arch=("x86_64")
url="https://gitlab.com/stanzabird/permfix"
license=("MPL2")
depends=("sqlite")
source=("https://gitlab.com/stanzabird/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=("ce2519230e1ef59db1839726aac36229367a024d427752c47d4321f775903e1b")

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
