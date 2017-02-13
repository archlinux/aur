# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=eepclock
pkgver=1.1
pkgrel=2
pkgdesc="Ham Radio UTC/Local-time Clock"
arch=('i686' 'x86_64')
url="http://hamsoftware.org/old_index.html"
license=('GPL3')
depends=('qt4' 'hamradio-menus')
source=(http://www.hamsoftware.org/${pkgname}_v$pkgver.tgz
	$pkgname.desktop)

build() {
	cd "$srcdir/${pkgname}_v$pkgver/"

	/usr/lib/qt4/bin/qmake
	make
}

package() {
	cd "$srcdir/${pkgname}_v$pkgver/"

	make INSTALL_ROOT="$pkgdir/" install

	install -Dm644 README.txt $pkgdir/usr/share/$pkgname/docs/README.txt
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 icons/green_oval.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('540e1555b4e7f1d306c94ff6c74093a1'
         '3eb8df691b6853765463097b4390213d')
sha256sums=('b3cd77abc1b88b357127ceb8364f743673ca4bf346b1a23e5e0d71a86d458c43'
            '65640701ec22684d85323f96b4005b9ab38792fed58034291ebf09067757a1c1')
