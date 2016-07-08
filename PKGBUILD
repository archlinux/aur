# Contributor: vit01 (vitirk) <me@ii-net.tk>

pkgname='cutiefeed'
pkgver='0.8.1'
pkgdesc="Qt-client for IDEC and ii-based networks (russian)"
pkgrel=1
arch=('any')
depends=('python' 'python-pyqt5' 'bash')
makedepends=('git')
conflicts=('iicli-modular')
license=('GPL3')
url="https://ii-net.tk/idec-doc"
source=('git+https://github.com/vit1-irk/cutiefeed/')
md5sums=('SKIP')
install=cutiefeed.install

package() {
	cd $srcdir/cutiefeed
	mkdir -p $pkgdir/usr/share/cutiefeed/
	mkdir -p $pkgdir/usr/share/icons/hicolor/16x16/apps/
	mkdir -p $pkgdir/usr/share/icons/hicolor/24x24/apps/
	mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps/
	mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps/

	mkdir -p $pkgdir/usr/share/applications/
	mkdir -p $pkgdir/usr/share/licenses/cutiefeed/

	mkdir -p $pkgdir/usr/bin/

	chmod -R 755 $srcdir/

	mv cutiefeed $pkgdir/usr/bin/cutiefeed

	mv cutiefeed.desktop $pkgdir/usr/share/applications/

	mv LICENSE $pkgdir/usr/share/licenses/cutiefeed/
	mv artwork/cutiefeed-16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/cutiefeed.png
	mv artwork/cutiefeed-24x24.png $pkgdir/usr/share/icons/hicolor/24x24/apps/cutiefeed.png
	mv artwork/cutiefeed-32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/cutiefeed.png
	cp artwork/cutiefeed.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/cutiefeed.svg

	mv * $pkgdir/usr/share/cutiefeed/
}
