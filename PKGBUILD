# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>

pkgname=libxmlbird
pkgver=1.2.9
pkgrel=1
pkgdesc='XML parsing library written in Vala'
arch=('i686' 'x86_64')
url='https://birdfont.org/xmlbird.php'
license=('LGPL3')
depends=('glib2')
makedepends=('vala' 'python')
source=(https://birdfont.org/xmlbird-releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('75395559ffbb928f517c868b551ff60c89f5a7619a3bbd23e1c2b0f89e48f27544f69d905079bf22a07d8e41a7efe55b8b4ce6b80a6f294be3329c1c539435ab'
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
