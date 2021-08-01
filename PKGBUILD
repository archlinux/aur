# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-linux-git
_pkgname=nbfc-linux
pkgver=0.1.5.r4.g6d80216
pkgrel=1
pkgdesc="Lightweight C port of NoteBook FanControl (no Mono required)"
arch=('i686' 'x86_64')
url="https://github.com/braph/nbfc-linux"
optdepends=('dmidecode: for getting recommended notebook configurations')
makedepends=('git')
license=('GPL3')
provides=('nbfc')
conflicts=('nbfc')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/.beta//g'
}

build() {
	cd "${srcdir}/${_pkgname}"

  make
}

package() {
	cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
