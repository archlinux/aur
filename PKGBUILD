# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>

pkgname=libxmlbird
pkgver=1.0.6
pkgrel=1
pkgdesc='XML parsing library written in Vala'
arch=('i686' 'x86_64')
url='https://birdfont.org/xmlbird.php'
license=('LGPL3')
depends=('glib2')
makedepends=('vala' 'python2')
source=(https://birdfont.org/xmlbird-releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('7d58216bfb6a880948ff6e76062cfcc6e7a41406bf50f5981df44e925d8a77ee2bea3b5aa58d4ca28ddd32c5ab1125dff0af3012a032446230b99454a47a420e'
            'SKIP')
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	python2 ./configure -p /usr
	python2 ./scripts/build_linux.py -p /usr
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	python2 ./install.py -d "${pkgdir}" -l /lib
}
