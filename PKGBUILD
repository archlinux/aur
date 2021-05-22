# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight C port of NoteBook FanControl (no Mono required)"
arch=('i686' 'x86_64')
url="https://github.com/braph/nbfc-linux"
optdepends=('dmidecode: for getting recommended notebook configurations')
makedepends=('lm_sensors')
license=('GPL3')
conflicts=('nbfc')
provides=('nbfc')
source=("https://github.com/braph/nbfc-linux/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('19b9f7d1f2da4186085aebf29f30152b7eae8bfc4313c07fe92dd4cc6545f4cece7362dba0ee36351f09ccff44437670eac72f544cbce69ff655caf771e3e043')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
