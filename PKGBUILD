# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>

pkgname=libxmlbird
pkgver=1.2.4
pkgrel=1
pkgdesc='XML parsing library written in Vala'
arch=('i686' 'x86_64')
url='https://birdfont.org/xmlbird.php'
license=('LGPL3')
depends=('glib2')
makedepends=('vala' 'python')
source=(https://birdfont.org/xmlbird-releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('07973dfac2ae59df626c71e99955ecafc64f94998e1583ac4b1b84e5de59ed98edcede66f8f3e4657ee83e5e8a177ad6807d93d089a615fb1e1b935e739b3061'
            'SKIP')
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure -p /usr
	./build.py
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./install.py -d "${pkgdir}" -l /lib
}
