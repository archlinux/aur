# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>

pkgname=libxmlbird
pkgver=1.2.7
pkgrel=1
pkgdesc='XML parsing library written in Vala'
arch=('i686' 'x86_64')
url='https://birdfont.org/xmlbird.php'
license=('LGPL3')
depends=('glib2')
makedepends=('vala' 'python')
source=(https://birdfont.org/xmlbird-releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('592b5e37d1604015492a18fe2bd3766a0e967a21ed830f6a52babb1d59ee07ddfb211f44e356526ed7edf7406fc13527904d8d8d9ac9cf3dbf99233fe7b4776e'
            'SKIP')
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure -p /usr -l /lib
	./build.py
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./install.py -d "${pkgdir}"
}
