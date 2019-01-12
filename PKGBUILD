# Maintainer: Thomas Benko <tombenkmo@gmail.com>

pkgname=minetest-mod-scifi_nodes-git
_gitname=${pkgname%-git}
pkgver=42.83a1a8c
pkgrel=1
#epoch=
pkgdesc="D00Med's sci-fi node collection"
arch=('any')
url="https://github.com/danielmeek32/scifi_nodes"
license=('LGPL'
	'CCPL')
#groups=()
depends=()
makedepends=('git')
#checkdepends=()
optdepends=('minetest-usrdir_patch'
	'mesecons-git'
	'minetest-mod-moreblocks-git')
provides=("$_gitname")
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=$pkgname.install
changelog=
source=("$_gitname::git+git://github.com/D00Med/scifi_nodes")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd "$srcdir/$_gitname"
	mkdir -p "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
	cp -r * "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
}
