# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.1.5
pkgrel=1
pkgdesc="Lightweight C port of NoteBook FanControl (no Mono required)"
arch=('i686' 'x86_64')
url="https://github.com/braph/nbfc-linux"
optdepends=('dmidecode: for getting recommended notebook configurations')
license=('GPL3')
conflicts=('nbfc')
provides=('nbfc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/braph/nbfc-linux/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0e6e391ecd516a9cb4b3607eefb1d225bf5e6288dcfbaf99e640452fb6c47ec1821c2de45599156c43b120581efe79f2f599ba14bf4bc460d477793da202869d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
