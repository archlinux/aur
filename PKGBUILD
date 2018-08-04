# Maintainer: Jesse Millar <hellojessemillar [at] gmail [dot] com>
# Contributor: onespaceman

pkgname=menu-calc-git
pkgver=v1.0.0.r5.g57a78d1
pkgrel=1
epoch=1
pkgdesc="A calculator for Rofi/dmenu(2)"
arch=('i686' 'x86_64')
url="https://github.com/jessemillar/menu-calc"
license=('MIT')
depends=(bc xclip)
optdepends=('rofi: calculator search support' 'dmenu: calculator search support')
makedepends=('git')
source=("git+https://github.com/jessemillar/menu-calc")
_gitname="menu-calc"
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --tags | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_gitname"
	install -Dm755 "=" "${pkgdir}/usr/bin/="
}
