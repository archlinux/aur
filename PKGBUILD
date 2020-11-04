# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxb-inspect-git
pkgver=v0.1.0.r0.g7d71696
pkgrel=1
pkgdesc="Generic C-implementation for Ambiorix Backend library"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/applications/amxb-inspect.git"
license=('MIT')

depends=(
	'lib_amxb'
)
makedepends=(
)
provides=(
	'amxb-inspect'
)
conflicts=(
	'amxb-inspect'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amxb-inspect.git#branch=${gitbranch}")
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
