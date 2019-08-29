# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
# Contributer: Aka <aka at worstofevils dot net>
# Contributer: Erus <erus.iluvatar at gmail dot com>
# Contributer: Erus <mike dot macmullin at audiles dot net>

pkgname=ncmatrix
pkgver=1.0
pkgrel=1
pkgdesc="A network version of cmatrix"
url="https://github.com/tree-s/ncmatrix"
arch=('i686' 'x86_64')
license=(GPL)
depends=('ncurses')
conflicts=('cmatrix')
options=('!buildflags')
source=(https://github.com/tree-s/ncmatrix/archive/v1.0-1.zip)
md5sums=('b94679d1b40d84d555d00b618892965e')

build() {
 	cd $srcdir/$pkgname-$pkgver-$pkgrel
 	./configure --prefix=/usr
 	make || return 1
}

package() {
 	cd "$pkgname-$pkgver-$pkgrel"
 	make PREFIX=/usr DESTDIR="$pkgdir" install
 	install -Dm644 matrix.fnt $pkgdir/usr/share/kbd/consolefonts/matrix.fnt
 	install -Dm644 matrix.psf.gz $pkgdir/usr/share/kbd/consolefonts/matrix.psf.gz
 	install -Dm644 mtx.pcf $pkgdir/usr/share/fonts/misc/mtx.pcf 
 	install -D -m644 COPYING $startdir/pkg/usr/share/licenses/ncmatrix/LICENSE
}
