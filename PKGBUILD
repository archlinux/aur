# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-animals_modpack-git
_gitname=${pkgname%-git*}
pkgver=631.963cef1
pkgrel=1
pkgdesc='Minetest Animals modpack (MOBF example mobs)'
arch=('any')
url="https://github.com/sapier/animals_modpack"
license=('custom')
depends=('minetest-mod-adv_spawning-git' 'minetest-mod-animalmaterials-git' 'minetest-mod-factions-git' \
'minetest-mod-intllib-git' 'minetest-mod-mobf_core-git')
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+git://github.com/sapier/animals_modpack.git")
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

