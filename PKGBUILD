# Maintainer: Jesse Millar <hellojessemillar [at] gmail [dot] com>
# Contributor: onespaceman

pkgname=menu-calc-git
pkgver=1.0.1
pkgrel=2
pkgdesc="A calculator for Rofi/dmenu(2)"
arch=('i686' 'x86_64')
url="https://github.com/jessemillar/menu-calc"
license=('MIT')
depends=(bc xclip)
optdepends=('rofi: calculator search support', 'dmenu: calculator search support')
makedepends=('git')
provides=('=')
source=("git+https://github.com/jessemillar/menu-calc")
_gitname="menu-calc"
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --tags | sed "s/.//"
}

prepare() {
	cd "$srcdir/$_gitname"
	git submodule update --init
}

package() {
	cd "$_gitname"

	sudo cp "=" ${pkgdir}/usr/bin
}
