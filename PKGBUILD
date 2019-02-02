# Maintainer: Thomas Benko <tombenkmo@gmail.com>

pkgname=minetest-mod-mobs_doom-git
_gitname=${pkgname%-git}
pkgver=5.fe2d4ec
pkgrel=1
#epoch=
pkgdesc="This Minetest mod adds some monsters from the famous game DOOM"
arch=('any')
url="https://github.com/D00Med/mobs_doom"
license=('GPL2')
#groups=()
#depends=()
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
source=("$_gitname::git+git://github.com/D00Med/mobs_doom.git")
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
