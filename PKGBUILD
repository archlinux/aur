# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxm-git
pkgver=v0.0.18.r0.g17d961f
pkgrel=1
pkgdesc="Generic C-implementation of modular support"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxm"
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

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxm.git#branch=${gitbranch}")
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
