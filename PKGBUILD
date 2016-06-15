# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-homedecor_modpack-git
_gitname=${pkgname%-git*}
pkgver=1151.9b61d20
pkgrel=1
pkgdesc='This mod adds a whole bunch of new items to minetest suitable for decorating inside and outside a home.'
arch=('any')
url="https://github.com/VanessaE/homedecor_modpack"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+git://github.com/VanessaE/homedecor_modpack.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
  cp -r * "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
}

