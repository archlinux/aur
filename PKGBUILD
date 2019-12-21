# Maintainer: Anthony VanBerkum <anthonyvbop@gmail.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: mk47at

pkgname=rftg
pkgver=0.9.5
pkgrel=2
pkgdesc="Singleplayer and online implementation of the card game Race for the Galaxy by Tom Lehman."
arch=('x86_64')
url="http://keldon.net/rftg/"
license=('GPL')
depends=('gtk2')
makedepends=('xorgproto')
source=("https://github.com/bnordli/rftg/archive/${pkgver}.tar.gz"
        "$pkgname.desktop"
        "rftg.svg")

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
 
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/rftg/$pkgname.svg"
}

md5sums=('9cd1154ba43651890bea4dc35b1678fc'
         'f2c1a72b0fbf191e564069dfe61d50c4'
         'e0ad78078729229ad1414276348b7d98')
