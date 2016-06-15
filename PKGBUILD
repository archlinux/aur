# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-mobs_sky-git
_gitname=${pkgname%-git*}
pkgver=7.ea462ec
pkgrel=1
pkgdesc='A few sky critters ported from other mob-frameworks to Mobs-Redo'
arch=('any')
url="https://github.com/blert2112/mobs_sky"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/blert2112/mobs_sky.git")
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

