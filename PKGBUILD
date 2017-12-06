# Maintainer: Jan Knížek < jk (a in a circle) janknizek.cz >
# Contributor: David Bailey <david.bailey@archlinux.net>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Nick Silva < nowhearthis (at) antisilent (dot) com >

pkgname=bashish
pkgver=2.2.4
pkgrel=2
pkgdesc="A theme enviroment for text terminals. It can change colors, font, transparency and background image on a per-application basis."
arch=('i686' 'x86_64')
url="http://bashish.sourceforge.net/"
license=('GPL')
depends=('dialog')
makedepends=('pkgconfig')
source=("https://downloads.sourceforge.net/bashish/$pkgname-$pkgver.tar.gz")
md5sums=('0661cc0040878e921ac7a31b071d20e0')
sha256sums=('3de48bc1aa69ec73dafc7436070e688015d794f22f6e74d5c78a0b09c938204b')
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
