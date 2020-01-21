# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxm-git
pkgver=v0.0.1.r0.g0335c40
pkgrel=1
pkgdesc="Generic C-implementation of modular support"
arch=('any')
url="https://gitlab.com/proj_amx_01/libraries/lib_amxm"
license=('MIT')

depends=(
	'lib_amxc'
)
makedepends=(
)
provides=(
	'lib_amxm'
)
conflicts=(
	'lib_amxm'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/proj_amx_01/libraries/lib_amxm.git#branch=${gitbranch}")
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
