# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=matmoul
_githubrepo=plasma-containmentactions-customdesktopmenu
_gitcommit=12faa87435610a2be884a424df637adaa3eb29f8

pkgname=plasma-addons-customdesktopmenu-git
pkgver=0.2.0.r3.12faa87
pkgrel=1
pkgdesc='Custom desktop menu for Plasma6'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL3')
#depends=('plasma-desktop' 'kdeplasma-addons')
depends=('kdeplasma-addons')
makedepends=('git' 'extra-cmake-modules')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
	cd "${_githubrepo}"/src
	./build.sh
}

package() {
	cd "${_githubrepo}"/_build
	install -D -m755 bin/plasma/containmentactions/matmoul-customdesktopmenu.so ${pkgdir}/usr/lib/qt6/plugins/plasma/containmentactions/matmoul-customdesktopmenu.so
}
