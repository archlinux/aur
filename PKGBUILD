# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxp-git
pkgver=v0.0.4.r2.gc38da30
pkgrel=1
pkgdesc="Generic C-API for common patterns"
arch=('any')
url="https://gitlab.com/proj_amx_01/libraries/lib_amxp"
license=('MIT')

depends=(
	'lib_amxc'
)
makedepends=(
)
provides=(
	'lib_amxp'
)
conflicts=(
	'lib_amxp'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/proj_amx_01/libraries/lib_amxp.git#branch=${gitbranch}")
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
