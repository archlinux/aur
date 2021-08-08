# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxd-git
pkgver=v3.2.1.r0.g84b2c0c
pkgrel=1
pkgdesc="Generic C-implementation for managing a data model"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxd.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxp'
)
makedepends=(
)
provides=(
	'lib_amxd'
)
conflicts=(
	'lib_amxd'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxd.git#branch=${gitbranch}")
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
