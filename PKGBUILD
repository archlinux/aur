# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxb-inspect-git
pkgver=v0.1.3.r0.g649600c
pkgrel=1
pkgdesc="Ambiorix Backend inspector/validation tool"
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
