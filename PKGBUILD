# Contributor: vit01 (vitirk) <me@ii-net.tk>

pkgname='iicli-modular'
pkgver='0.5'
pkgdesc="simple gui client for ii network"
pkgrel=1
arch=('any')
depends=('python' 'python-pyqt5' 'bash')
optdepends=('tk')
makedepends=('git')
license=('CC0')
url="http://ii-net.tk/ii-doc"
source=('git+https://github.com/vit1-irk/iicli-modular/')
md5sums=('SKIP')
install=iicli-modular.install

package() {
	cd $srcdir/iicli-modular
	mkdir -p $pkgdir/usr/share/iicli-modular/
	mkdir -p $pkgdir/usr/share/icons/hicolor/16x16/apps/
	mkdir -p $pkgdir/usr/share/icons/hicolor/24x24/apps/
	mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps/
	mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps/
	
	mkdir -p $pkgdir/usr/share/applications/
	mkdir -p $pkgdir/usr/share/licenses/iicli-modular/
	
	mkdir -p $pkgdir/usr/bin/

	chmod -R 755 $srcdir/
	
	mv qtii $pkgdir/usr/bin/ii-client-qt
	mv tkii $pkgdir/usr/bin/ii-client-tk

	mv iicli-qt.desktop $pkgdir/usr/share/applications/
	mv iicli-tk.desktop $pkgdir/usr/share/applications/
	
	mv LICENSE $pkgdir/usr/share/licenses/iicli-modular/
	mv artwork/iilogo-16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/iilogo.png
	mv artwork/iilogo-24x24.png $pkgdir/usr/share/icons/hicolor/24x24/apps/iilogo.png
	mv artwork/iilogo-32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/iilogo.png
	mv artwork/iilogo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/iilogo.svg

	mv * $pkgdir/usr/share/iicli-modular/
}
