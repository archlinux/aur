# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

pkgname=sockso
pkgver=1.5.3
pkgrel=1
pkgdesc="A free open source Personal Music Server for everyone."
arch=('i686' 'x86_64')
url="http://sockso.pu-gh.com/"
license=('GPL')
depends=('java-runtime')	# Or 'jre'
source=(http://sockso.googlecode.com/files/${pkgname}-${pkgver}.zip $pkgname ${pkgname}.desktop ${pkgname}.png)

md5sums=('8ec802be2d8cfcbb107b374f7eb23ba3'
         'c41319ca107174cbb8f1fa4315570123'
         'de125a1492ca8f3a6ce5334a81d33229'
         '16da5e24b73441a98fdd409adb656f43')

build() {
	
	# Delete win garbage
	rm -f $srcdir/${pkgname}-${pkgver}/windows.bat
	
	# Make directory
	mkdir -p $pkgdir/opt/$pkgname/
	
	# Copy files
	cp -R $srcdir/${pkgname}-${pkgver}/* $pkgdir/opt/$pkgname/
	
	# Install bin
	install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname

	# Install .desktop and program icon
	mkdir -p $pkgdir/usr/share/applications
	install -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/
	mkdir -p $pkgdir/usr/share/icons
	install -m644 $srcdir/${pkgname}.png $pkgdir/usr/share/icons

} 
