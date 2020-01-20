# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxc-git
pkgver=v0.1.1.r3.g128ff19
pkgrel=1
pkgdesc="Generic C-implementation of data containers"
arch=('any')
url="https://gitlab.com/proj_amx_01/libraries/lib_amxc"
license=('MIT')

depends=(
)
makedepends=(
)
provides=(
	'lib_amxc'
)
conflicts=(
	'lib_amxc'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/proj_amx_01/libraries/lib_amxc.git#branch=${gitbranch}")
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
	make DEST="${pkgdir}/" INSTALL_LIB_DIR="/lib" install
}
