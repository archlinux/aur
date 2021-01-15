# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxo-cg-git
pkgver=v0.2.3.r0.g02eee25
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
)
conflicts=(
	'amxo-cg'
)

gitbranch="master"

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
	make DEST="${pkgdir}/" install
}
