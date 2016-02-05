# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-animalmaterials-git
_gitname=${pkgname%-git*}
pkgver=585.d952d27
pkgrel=1
pkgdesc='Minetest mod for animalmaterials containing resources to be used for mobs and animals'
arch=('any')
url="https://github.com/sapier/animalmaterials"
license=('custom')
depends=('minetest')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+git://github.com/sapier/animalmaterials.git")
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

