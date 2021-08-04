# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.1.5
pkgrel=2
pkgdesc="Lightweight C port of NoteBook FanControl (no Mono required)"
arch=('i686' 'x86_64')
url="https://github.com/nbfc-linux/nbfc-linux"
optdepends=('dmidecode: for getting recommended notebook configurations')
license=('GPL3')
conflicts=('nbfc')
provides=('nbfc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nbfc-linux/nbfc-linux/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('3acfa0cfa7e72e2dd1a496d6285b79b8bf1fc272b8094c87c656ce4f0ca5a60f308e6966f3374e1af2cd2f8bf32482abd7f215550f807ba8940acd4d44bdff56')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
