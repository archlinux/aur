# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Bennett Goble <nivardus at gmail dot com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=demorse
pkgver=1.2
pkgrel=4
pkgdesc="console application for decoding Morse code signals into text."
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/morse/demorse/demorse.html"
license=('GPL3')
depends=('alsa-lib')
makedepends=('autoconf' 'automake')
changelog=Changelog
source=("http://www.qsl.net/5b4az/pkg/morse/${pkgname}/${pkgname}-${pkgver}.tar.bz2")

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install

	# documentation
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 README doc/* "${pkgdir}/usr/share/doc/${pkgname}"
}
md5sums=('9ada5fc36f317367fbfd6438c406b9f8')
sha256sums=('cc4f962afb3fc4b4f65cc7ce362147022bf993bc2e85e349d7b6b4656a06c43c')
