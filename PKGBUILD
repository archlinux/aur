# Maintainer: Thomas Benko <tombenkmo@gmail.com>

pkgname=minetest-mod-animals_chicken-git
_gitname=${pkgname%-git}
pkgver=7.44a04c2
pkgrel=1
#epoch=
pkgdesc="danielmeek32's animals mod for Minetest - the chicken"
arch=('any')
url="https://github.com/danielmeek32/animals_chicken"
license=('custom:modified zlib-license')
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
source=("$_gitname::git+git://github.com/danielmeek32/animals_chicken")
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
