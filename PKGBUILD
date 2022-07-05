# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.1.7
pkgrel=3
pkgdesc="Lightweight C port of NoteBook FanControl (no Mono required)"
arch=('i686' 'x86_64')
url="https://github.com/nbfc-linux/nbfc-linux"
optdepends=('dmidecode: for getting recommended notebook configurations')
license=('GPL3')
conflicts=('nbfc')
provides=('nbfc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nbfc-linux/nbfc-linux/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('445fb723e62749b0a760dad34e507c45e6502f9f45272eba192b377587e98bf8373284e155ccbe145bb08e3aa4ca611bb82db1f4e99b04c865332f9a5c6df6ef')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr confdir=/etc
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr confdir=/etc DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
