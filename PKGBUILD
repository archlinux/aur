# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amx_cli-git
pkgver=v0.2.16.r0.g9b24f3f
pkgrel=1
pkgdesc="Ambiorix Interactive Command Line Interface"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/applications/amx-cli.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxd'
	'lib_amxo'
	'lib_amxj'
	'lib_amxt'
	'lib_amxm'
)
makedepends=(
)
provides=(
	'amx_cli'
)
conflicts=(
	'amx_cli'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amx-cli.git#branch=${gitbranch}")
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
