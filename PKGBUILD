# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-advtrains-git
_gitname=${pkgname%-git*}
pkgver=380.a71041b
pkgrel=1
pkgdesc='This mod adds good-looking, realistic trains to minetest. It also introduces rails that make turns of only 30 degrees instead of 90. (Mod for Minetest)'
arch=('any')
url="https://git.bananach.space/advtrains"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://git.bananach.space/advtrains.git")
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

