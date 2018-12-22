# Maintainer: Thomas Benko <tombenkmo@gmail.com>

pkgname=minetest-mod-advanced_npc-git
_gitname=${pkgname%-git}
pkgver=258.a43233f
pkgrel=1
#epoch=
pkgdesc="hkzorman's advanced npc mod for Minetest. Still under development!"
arch=('any')
url="https://github.com/hkzorman/advanced_npc"
license=('GPL3')
#groups=()
depends=('minetest-mod-mobs_redo-git')
makedepends=('git')
#checkdepends=()
optdepends=('minetest-usrdir_patch')
provides=("$_gitname")
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=$pkgname.install
changelog=
source=("$_gitname::git+git://github.com/hkzorman/advanced_npc.git")
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
