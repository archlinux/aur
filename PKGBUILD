# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-more_monsters-git
_gitname=${pkgname%-git*}
pkgver=5.9259396
pkgrel=1
pkgdesc='Extra mobs for Minetest.'
arch=('any')
url="https://github.com/blert2112/mobs_more_monsters"
license=('custom')
depends=('minetest-mod-mobs_redo-git')
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/blert2112/mobs_more_monsters.git")
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

