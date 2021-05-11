# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux
pkgver=0.0.1
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
sha512sums=('fb23e610941e7c9a67354d1dcdd6c27c324c9eef87dc389ea05ff1db7be7ba3d89b9cb95677c90de487810e0658f0c798d9821c0ebd2c9c2421ae6db6f612382')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
