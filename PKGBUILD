# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.1.6
pkgrel=1
pkgdesc="Lightweight C port of NoteBook FanControl (no Mono required)"
arch=('i686' 'x86_64')
url="https://github.com/nbfc-linux/nbfc-linux"
optdepends=('dmidecode: for getting recommended notebook configurations')
license=('GPL3')
conflicts=('nbfc')
provides=('nbfc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nbfc-linux/nbfc-linux/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d526e566aa0900ab41d60bc1041095323d528b3c131093206530f86eeb343660f9bcc056b228bbbfaad8337983d9a60216e5aa980e82de554af8b66f1a64b06d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
