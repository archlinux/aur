# Maintainer: Thomas Benko <tombenkmo@gmail.com>

pkgname=minetest-mods-dmobs-git
_gitname=${pkgname%-git}
pkgver=73.0e43362
pkgrel=3
#epoch=
pkgdesc="D00Med mobs mod, some animals and monsters, ie. butterfly, nyancat, golem or skeleton."
arch=('any')
url="https://github.com/danielmeek32/animals"
license=('LGPL' 'CCPL')
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
source=("$_gitname::git+git://github.com/D00Med/dmobs")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd "$srcdir/$_gitname"
	mkdir -p "$pkgdir/usr/share/minetest/mods/${_gitname#*mods-}"
	cp -r * "$pkgdir/usr/share/minetest/mods/${_gitname#*mods-}"
}
