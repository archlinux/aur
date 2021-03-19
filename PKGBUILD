# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxj-git
pkgver=v0.3.7.r0.gc1acb96
pkgrel=1
pkgdesc="JSON Reader/generation - JSON string variant"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxj.git"
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

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxj.git#branch=${gitbranch}")
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
