# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=matmoul
_githubrepo=plasma-containmentactions-customdesktopmenu
_gitcommit=44c78befa925481ae96caa6cfd5476d13592b1d4

pkgname=plasma-addons-customdesktopmenu-git
pkgver=0.1.1.r1.44c78be
pkgrel=1
pkgdesc='Custom desktop menu for Plasma5'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('plasma-workspace')
makedepends=('git' 'extra-cmake-modules')
install="${pkgname}.install"
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
	cd "${_githubrepo}"/src
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "${_githubrepo}"/src/build
	install -D -m755 bin/plasma_containmentactions_customdesktopmenu.so ${pkgdir}/usr/lib/qt/plugins/plasma/containmentactions/plasma_containmentactions_customdesktopmenu.so
}
