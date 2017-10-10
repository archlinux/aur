# Maintainer: nano thirteen <nano13@gmx.net>

pkgname=minetest-mod-stargate-git
_gitname=${pkgname%-git*}
pkgver=11.b8bd9cf
pkgrel=1
pkgdesc="StarGate SF series inspired travel network. "
arch=('any')
url="https://github.com/minetest-mods/stargate"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git://github.com/minetest-mods/stargate.git")
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

