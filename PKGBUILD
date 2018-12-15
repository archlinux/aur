# Maintainer: Thomas Benko <tombenkmo@gmail.com>

pkgname=minetest-mod-unifieddyes-git
_gitname=${pkgname%-git}
pkgver=76.cea39f6
pkgrel=1
#epoch=
pkgdesc="FozLand's unifieddyes mod for Minetest"
arch=('any')
url="https://github.com/FozLand/unifieddyes"
license=('GPL2')
#groups=()
depends=('bash')
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
source=("$_gitname::git+git://github.com/FozLand/unifieddyes.git")
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
