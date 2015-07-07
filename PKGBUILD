# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=gno3dtet
pkgver=1.96.1
pkgrel=2
pkgdesc="Slick top-down 3D Tetris game"
arch=('i686')
url="http://eseb.net/3dtetris.php"
license=('GPL')
depends=('libgnomeui' 'librsvg')
source=(ftp://eseb.net/pub/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('f298fe3306d5938ef843302a31a19713')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh --prefix=/usr --localstatedir=/var
  make || return 1
  make DESTDIR=$pkgdir install

  chmod 775 $pkgdir/var/games
  chmod 644 $pkgdir/var/games/gno3dtet.hof

  rm -rf $pkgdir/usr/share/locale/
}
