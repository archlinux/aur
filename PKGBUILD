# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=matmoul
_githubrepo=plasma-containmentactions-customdesktopmenu
_pkgtagname=v0.1.1

pkgname=plasma-addons-customdesktopmenu
pkgver=0.1.1
pkgrel=1
pkgdesc='Custom desktop menu for Plasma5'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('plasma-workspace')
makedepends=('git' 'extra-cmake-modules')
install=${pkgname}.install
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz")
sha256sums=('1605fec314098c42062da8592db4f54391ee96dc3b0169d9b577fbd26b6d2254')

build() {
	cd "${_githubrepo}-${pkgver}"/src
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "${_githubrepo}-${pkgver}"/src/build
	install -D -m755 bin/plasma_containmentactions_customdesktopmenu.so ${pkgdir}/usr/lib/qt/plugins/plasma/containmentactions/plasma_containmentactions_customdesktopmenu.so
}
