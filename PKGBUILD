# Maintainer: Thomas Benko <tombenkmo@gmail.com>

pkgname=minetest-mod-working_villages-git
_gitname=${pkgname%-git}
pkgver=211.ae65979
pkgrel=1
#epoch=
pkgdesc="theFox6's villages mod for Minetest"
arch=('any')
url="https://github.com/theFox6/working_villages"
license=('MIT')
#groups=()
depends=()
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
source=("$_gitname::git+git://github.com/theFox6/working_villages")
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
