# Contributor: Dan McGee <dpmcgee@gmail.com>

pkgname=xerox-phaser-3040
pkgver=1.0
_pkgver=1.0-28
pkgrel=2
pkgdesc="Driver for the Xerox Phaser 3040"
url="http://www.support.xerox.com/support/phaser-3040/downloads/enin.html?operatingSystem=linux&fileLanguage=en_GB"
license=('custom')
arch=('i686' 'x86_64')
depends=('foomatic-db-engine')
[ "$CARCH" = "x86_64" ] && depends+=('lib32-libcups')
[ "$CARCH" = "i686" ] && depends+=('libcups')

makedepends=('rpmextract')
source=(http://download.support.xerox.com/pub/drivers/3010/drivers/linux/en_GB/Xerox-Phaser-3010_3040-1.0-28.i586.zip)
md5sums=('4a9876e41e0ac9022d482a2316426bec')

package() {
	cd "${srcdir}"
	rpmextract.sh Xerox-Phaser-3010_3040-${_pkgver}.i586.rpm

	cp -R "${srcdir}"/usr "${pkgdir}"
}

