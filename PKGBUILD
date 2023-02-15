# Maintainer: kraftwerk28 <kefirchik3@gmail.com>

_pkgname=lua-i3ipc
pkgname="${_pkgname}-git"
pkgver=r41.4c983f3
pkgrel=1
pkgdesc="A lua library for controlling i3wm & Sway"
arch=('any')
url="https://github.com/kraftwerk28/${_pkgname}.git"
license=('MIT')
depends=('luajit' 'lua51-luv' 'lua51-cjson')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/kraftwerk28/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	local lua=5.1
	cd "$_pkgname"
	local install_dir="${pkgdir}/${_pkgname}/usr/share/lua/5.1"
	mkdir -p "$install_dir"
	cp -R "$PWD/i3ipc" "$install_dir"
}
