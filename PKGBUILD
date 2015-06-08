# Maintainer: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>
_gitname="alopex"
pkgname="${_gitname}-git"
pkgver=4.420.bbd6ee2
pkgrel=1
pkgdesc="A Tabbed, Tiling Window Manager with Fur"
url="http://trilbywhite.github.io/alopex/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('libxinerama' 'cairo')
makedepends=('git')
source=("${_gitname}::git://github.com/TrilbyWhite/alopex.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}";
	echo "4.$(git rev-list --count HEAD).$(git describe --always )"
}

build() {
	cd "${_gitname}"
	make
}

package() {
	cd "${_gitname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
