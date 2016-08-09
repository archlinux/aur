# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-subgame-ctf_pvp_engine-git
_gitname=${pkgname%-git*}
pkgver=158.dcfcb37
pkgrel=1
pkgdesc='A highly modular framework for the Minetest game engine (Minetest Capture the Flag engine)'
arch=('any')
url="https://github.com/rubenwardy/ctf_pvp_engine"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/rubenwardy/ctf_pvp_engine.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/minetest/games/${_gitname#*subgame-}"
  cp -r * "$pkgdir/usr/share/minetest/games/${_gitname#*subgame-}"
}

