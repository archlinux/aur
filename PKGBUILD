# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
# Contributer: Aka <aka at worstofevils dot net>
# Contributer: Erus <erus.iluvatar at gmail dot com>

pkgname=ncmatrix
pkgver=1.0
pkgrel=2
pkgdesc="A network version of cmatrix"
url="http://webpages.charter.net/tux/ncmatrix/index.htm"
arch=('i686' 'x86_64')
license=(GPL)
depends=('ncurses')
conflicts=('cmatrix')
options=('!buildflags')
source=(http://webpages.charter.net/tux/ncmatrix/ncmatrix-1.0.zip)
md5sums=('a8889a16f94b6672c7a033376d6c75fc')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
cd "$pkgname-$pkgver"
make PREFIX=/usr DESTDIR="$pkgdir" install
install -Dm644 matrix.fnt $pkgdir/usr/share/kbd/consolefonts/matrix.fnt
install -Dm644 matrix.psf.gz $pkgdir/usr/share/kbd/consolefonts/matrix.psf.gz
install -Dm644 mtx.pcf $pkgdir/usr/share/fonts/misc/mtx.pcf 
install -D -m644 COPYING $startdir/pkg/usr/share/licenses/ncmatrix/LICENSE
}
