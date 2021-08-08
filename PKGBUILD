# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxo_xml_to-git
pkgver=v0.1.3.r0.gf1c6324
pkgrel=1
pkgdesc="Ambiorix XML converter"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/applications/amxo-xml-to.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxj'
	'libxslt'
)
makedepends=(
)
provides=(
	'amxo_xml_to'
)
conflicts=(
	'amxo_xml_to'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amxo-xml-to.git#branch=${gitbranch}")
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
