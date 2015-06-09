# Maintainer: Daniel Dietrich <shaddow2k@@gmail..com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=imageenlarger
pkgver=0.9.0
pkgrel=2
pkgdesc="Small graphical tool (based on Qt) to resize, especially magnify bitmaps in high quality. (also called SmillaEnlarger)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/imageenlarger/"
depends=('qt4')
source=("http://downloads.sourceforge.net/project/imageenlarger/imageenlarger/SmillaEnlarger%20Release%20${pkgver}/SmillaEnlarger_${pkgver}_source.zip"
	SmillaEnlarger.desktop)

build() {
	cd "${srcdir}/SmillaEnlarger_${pkgver}_source/SmillaEnlargerSrc/"
	qmake-qt4 ImageEnlarger.pro
	make
}

package() {
	cd "${srcdir}/SmillaEnlarger_${pkgver}_source/SmillaEnlargerSrc/"
	
	# bin
	install -d "$pkgdir/usr/bin/"
	install -D -m755 SmillaEnlarger "$pkgdir/usr/bin/"

	#Desktop Launcher
	install -D -m644 "$srcdir/SmillaEnlarger.desktop" "$pkgdir/usr/share/applications/SmillaEnlarger.desktop"
	
	#Icon
	install -D -m644 smilla.ico "$pkgdir/usr/share/pixmaps/smilla.ico"
	install -D -m644 smilla.png "$pkgdir/usr/share/pixmaps/smilla.png"
}
md5sums=('a2ce1db14eb2c8addd97986e65da0689'
         '294dac02f8e7d679acac375cd6f9aa28')
