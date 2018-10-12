# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-lightning-git
_gitname=${pkgname%-git*}
pkgver=20.39bd36c
pkgrel=1
pkgdesc='Lightning mod that strikes randomly above ground, set blocks on fire, and possibly change sand into glass, tree trunks into coal, and more. (Mod for Minetest)'
arch=('any')
url="https://github.com/minetest-mods/lightning"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/minetest-mods/lightning.git")
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

