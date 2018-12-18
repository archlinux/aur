# Maintainer: Thomas Benko <tombenkmo@gmail.com>

pkgname=minetest-mod-animals_wolf-git
_gitname=${pkgname%-git}
pkgver=8.ae23c51
pkgrel=1
#epoch=
pkgdesc="danielmeek32's animals mod for Minetest - the wolf"
arch=('any')
url="https://github.com/danielmeek32/animals_wolf"
license=('GPL3')
#groups=()
depends=('minetest-mod-animals-git')
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
source=("$_gitname::git+git://github.com/danielmeek32/animals_wolf")
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
