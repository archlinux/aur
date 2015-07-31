# Maintainer: David Bailey <david.bailey@archlinux.net>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Nick Silva < nowhearthis (at) antisilent (dot) com >

pkgname=bashish
pkgver=2.2.4
pkgrel=1
pkgdesc="Bashish is a theme enviroment for text terminals. It can change colors, font, transparency and background image on a per-application basis."
arch=('i686' 'x86_64')
url="http://bashish.sourceforge.net/"
license="GPL"
depends=('dialog')
makedepends=('pkgconfig')
source=("http://downloads.sourceforge.net/bashish/$pkgname-$pkgver.tar.gz")
md5sums=('0661cc0040878e921ac7a31b071d20e0')
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
