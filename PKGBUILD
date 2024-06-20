# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.2.7
pkgrel=1
pkgdesc="Lightweight C port of NoteBook FanControl (no Mono required)"
arch=('i686' 'x86_64')
url="https://github.com/nbfc-linux/nbfc-linux"
license=('GPL3')
conflicts=('nbfc')
provides=('nbfc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nbfc-linux/nbfc-linux/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('05273e24b10346994675a34fc9464e10555f25a877f99f517239ac9f449a9731a93f297c57593988fc84ec6db633acaf42bddd8ab5c3abff0ad84603ed26cade')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh && ./configure --prefix=/usr --sysconfdir=/etc --bindir=/usr/bin && make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
