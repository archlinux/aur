# Contributor: Nagy Gabor <Gabor.V.Nagy@@gmail.com>
# Based on the PKGBUILD of Víctor Martínez Romanos <vmromanos@gmail.com>

pkgname=alevt
pkgver=1.6.3
pkgrel=4
pkgdesc="A teletext/videotext decoder and browser for the vbi device and X11"
arch=('i686' 'x86_64')
url="http://www.goron.de/~froese"
license=('GPL')
depends=('libpng' 'libx11')
install=alevt.install
#source=(http://www.goron.de/~froese/alevt/$pkgname-$pkgver.tar.gz alevt.desktop)
source=(http://fossies.org/linux/misc/old/$pkgname-$pkgver.tar.gz alevt.desktop)
md5sums=('9d3878030ca25fe76c5d4f288f7b4d0d'
         '10dbfcafa9ff0b5f9ce17ab98e7eadec')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -m755 -d $pkgdir/usr/{bin,share/man/man1,share/pixmaps,share/applications}
  install -m755 alevt alevt-cap alevt-date $pkgdir/usr/bin
  install -m644 alevt.1x alevt-date.1 alevt-cap.1 $pkgdir/usr/share/man/man1
  install -m644 contrib/mini-alevt.xpm $pkgdir/usr/share/pixmaps
  install -m644  $srcdir/alevt.desktop $pkgdir/usr/share/applications/
}
