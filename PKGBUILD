# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxo-cg-git
pkgver=v1.1.6.r0.ga0ab6e1
pkgrel=1
pkgdesc="ODL (Object Definition Language) Compiler/Generator"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/applications/amxo-cg.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxd'
	'lib_amxo'
)
makedepends=(
)
provides=(
	'amxo-cg'
	'amxo_cg'
)
conflicts=(
	'amxo-cg'
	'amxo_cg'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amxo-cg.git#branch=${gitbranch}")
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
