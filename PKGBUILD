# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.1.4
pkgrel=1
pkgdesc="Lightweight C port of NoteBook FanControl (no Mono required)"
arch=('i686' 'x86_64')
url="https://github.com/braph/nbfc-linux"
optdepends=('dmidecode: for getting recommended notebook configurations')
license=('GPL3')
conflicts=('nbfc')
provides=('nbfc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/braph/nbfc-linux/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9a097a66c410ada0fb0984d717ec5432543cead5a8abce36ae3ccba58ff88d3891b45e7086477c7890da05a5b7478e233ca728df61aec54b3df47c3d2bfd6ad9')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
