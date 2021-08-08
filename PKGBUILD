# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxo-git
pkgver=v1.3.3.r0.g6ae7bfb
pkgrel=1
pkgdesc="Generic C-implementation for ODL (Object Definition Language)"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxo.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxd'
)
makedepends=(
)
provides=(
	'lib_amxo'
)
conflicts=(
	'lib_amxo'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxo.git#branch=${gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make DEST="${pkgdir}/" LIBDIR="/usr/lib" install
}
