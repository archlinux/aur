# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Bennett Goble <nivardus at gmail dot com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=demorse
pkgver=1.2
pkgrel=3
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
md5sums=('d4800b759ef4c8ffb6e73d173bcd563b')
sha256sums=('48228b121f4df3bcd735a7c60871d9bea1c7f066da78c6f74e28694b8300a4ab')
