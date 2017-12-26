# Maintainer: rebel <novakpetya at yahoo dot co dot uk>

pkgname=lazarus-qt5-svn
pkgver=1.9
pkgrel=2
pkgdesc="Delphi-like IDE for FreePascal qt5 version"
arch=(x86_64)
url=https://www.lazarus-ide.org/
license=(GPL2)
conflicts=(lazarus-qt lazarus-gtk2 lazarus-qt5)
depends=(fpc fpc-src qt5-base qt5pas lazarus-svn)
makedepends=(subversion)
source=("$pkgname::svn+https://svn.freepascal.org/svn/lazarus/trunk")

build() {
	cd $pkgname
	make clean bigide LCL_PLATFORM=qt5
}

package() {
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/lib/lazarus
        mkdir -p $pkgdir/usr/share/applications $pkgdir/usr/share/pixmaps
	cd $pkgname
	cp lazarus $pkgdir/usr/lib/lazarus
	cp startlazarus $pkgdir/usr/lib/lazarus
	cp install/lazarus.desktop $pkgdir/usr/share/applications
        cp images/ide_icon48x48.png ${pkgdir}/usr/share/pixmaps/lazarus.png
	cd $pkgdir/usr/bin
	ln -f -s ../lib/lazarus/lazarus lazarus
	ln -f -s ../lib/lazarus/startlazarus startlazarus

}
sha256sums=('SKIP')
