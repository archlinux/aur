# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=eepbeacon
pkgver=1.0
pkgrel=2
pkgdesc="Ham Radio HF Beacon Assistant"
arch=('i686' 'x86_64')
url="http://hamsoftware.org/old_index.html"
license=('GPL3')
depends=('qt4>=4.7' 'qtwebkit' 'hamradio-menus')
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
	install -Dm644 images/$pkgname-icon.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('4adcb63b575395e658731a25857a0799'
         '380fbc7f445b21bd8b73c08b0738e3a4')
sha256sums=('06c136182c6b13d660af6e4805ea345619564e8eba06c5f2b83c2c38a7843a8f'
            'fb8f45698523f241167a3bc59d08ffcc138b88fc672314df15646e8e440ef7b7')
