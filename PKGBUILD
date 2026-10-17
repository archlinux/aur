# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Roman Kyrylych roman[at]archlinux.org
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=lightscribe-labeler
pkgver=1.18.15.1
pkgrel=6
pkgdesc="LightScribe Simple Labeler"
arch=('x86_64')
url="http://www.lightscribe.com/downloadSection/linux/index.aspx?id=815"
license=('custom')
depends=('lib32-lightscribe' 'lib32-libstdc++5' 'lib32-libpng12' 'lib32-gcc-libs' 'lib32-glibc'
         'lib32-zlib' 'lib32-freetype2' 'lib32-fontconfig' 'lib32-libx11' 'lib32-libxext'
         'lib32-libxrender' 'lib32-libsm' 'lib32-libice' 'lib32-libxi' 'lib32-libxcursor'
         'lib32-libxrandr')
optdepends=('lib32-libxinerama: multi-monitor support')
source=(http://files.jkvinge.net/packages/lightscribe/lightscribeApplications-1.18.15.1-linux-2.6-intel.rpm)
options=('!strip')

package() {
	cd $srcdir
	cp -R opt $pkgdir
	find $pkgdir -type d -exec chmod 755 {} \;
	chmod -x $pkgdir/opt/lightscribeApplications/SimpleLabeler/qt.conf

	mkdir -p $pkgdir/usr/bin
	cd $pkgdir/usr/bin
	ln -s ../../opt/lightscribeApplications/SimpleLabeler/SimpleLabeler lightscribe-labeler

	mkdir -p $pkgdir/usr/share/licenses/lightscribe-labeler
	mv $pkgdir/opt/lightscribeApplications/lightscribeLicense.rtf $pkgdir/usr/share/licenses/lightscribe-labeler/license.rtf
}
md5sums=('bf5eb9aa41e3b5f4d0c879591464c1db')
sha256sums=('2e8cf6887974ac1bd4ee8d415a4160a75b39d31d33394eb7284d7179862fa504')
