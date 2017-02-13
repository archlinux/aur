# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=eepkeyer
pkgver=1.7
pkgrel=3
pkgdesc="Ham Radio Contest CW Keyer"
arch=('i686' 'x86_64')
url="http://hamsoftware.org/old_index.html"
license=('GPL3')
depends=('qt4' 'hamradio-menus')
optdepends=('xlog: logbook'
	    'hamlib: rig interfacing'
	    'cwdaemon: transmitting cw'
	    'winkeydaemon: usb cw xmit'
	    'cabanalyst: cabrillo generation')
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
	install -Dm644 images/*.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('49a908a2380ecd30c0f1fa05d1e5db64'
         '0a9b720f7c8dba3b691c8c6c14e199ff')
sha256sums=('5702726a8a68896820390033c4265c00730690b42dbdd05f1bf55ef4c3bb12b6'
            '2a57de4da7f86c1d158f3fe331d7e0bfe0949f914207af5b3d50613eec44f607')
