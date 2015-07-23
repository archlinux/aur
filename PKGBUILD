# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xskat
pkgver=4.0
pkgrel=7
pkgdesc="The card game Skat as defined by the official Skat Order"
arch=('i686' 'x86_64')
url="http://www.xskat.de/xskat.html"
license=('custom')
depends=('libx11')
source=(http://www.xskat.de/$pkgname-$pkgver.tar.gz xskat.desktop)
md5sums=('6744cea48a890771736b75083e7ea2b5'
         'f863249c1fb206444097c277c5cf913f')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $srcdir/$pkgname-$pkgver/README \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/$pkgname.desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $srcdir/$pkgname-$pkgver/icon.xbm \
    $pkgdir/usr/share/icons/$pkgname.xbm
  install -Dm644 $srcdir/$pkgname-$pkgver/xskat.man \
    $pkgdir/usr/share/man/man6/$pkgname.6
  install -Dm644 $srcdir/$pkgname-$pkgver/xskat-de.man \
    $pkgdir/usr/share/man/de/man6/$pkgname.6
}
