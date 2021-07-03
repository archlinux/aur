# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.1.3
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
sha512sums=('0495c63ad3866468d53583690a4ba903bdc48741f44afdd492d6353e90288655709062ab4414da772a5616ce0dad51d67b9252ffd732da7586736a8e9b7dd695')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
