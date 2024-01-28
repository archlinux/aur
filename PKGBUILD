# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.1.12
pkgrel=1
pkgdesc="Lightweight C port of NoteBook FanControl (no Mono required)"
arch=('i686' 'x86_64')
url="https://github.com/nbfc-linux/nbfc-linux"
license=('GPL3')
conflicts=('nbfc')
provides=('nbfc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nbfc-linux/nbfc-linux/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('29209e71a2e4e21139195ce7889a11f84d1326c2ec344a584f21ef3f256bd05566983fc323a743f584bb670e22bc3a17da999a5eb0d9033a0b6e5ea021707723')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr confdir=/etc
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr confdir=/etc DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
