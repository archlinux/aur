# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>

pkgname=libxmlbird
pkgver=1.1.0
pkgrel=1
pkgdesc='XML parsing library written in Vala'
arch=('i686' 'x86_64')
url='https://birdfont.org/xmlbird.php'
license=('LGPL3')
depends=('glib2')
makedepends=('vala' 'python')
source=(https://birdfont.org/xmlbird-releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('b9c148d3f691e99b814648d4a59fcffaedfe5224788db3bd6069f03589e350b5dab59fefdc3cb6460271a2e9c483b0731e979a135ed751a9833ab973eb90acd8'
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
