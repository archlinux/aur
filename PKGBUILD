# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-areas-git
_gitname=${pkgname%-git*}
pkgver=59.8b0b8c1
pkgrel=1
pkgdesc='A rewrite of the node_ownership Minetest mod with many new features. (Mod for Minetest)'
arch=('any')
url="https://github.com/ShadowNinja/areas"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/ShadowNinja/areas.git")
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

