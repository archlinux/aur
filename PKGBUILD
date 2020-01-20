# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxj-git
pkgver=v0.0.3.r3.g58289ff
pkgrel=1
pkgdesc="JSON Reader/generation - JSON string variant"
arch=('any')
url="https://gitlab.com/proj_amx_01/libraries/lib_amxj"
license=('MIT')

depends=(
	'lib_amxc'
	'yajl'
)
makedepends=(
)
provides=(
	'lib_amxj'
)
conflicts=(
	'lib_amxj'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/proj_amx_01/libraries/lib_amxj.git#branch=${gitbranch}")
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
