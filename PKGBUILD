# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-intllib-git
_gitname=${pkgname%-git*}
pkgver=19.475711f
pkgrel=1
pkgdesc='Internationalization library for Minetest.'
arch=('any')
url="https://github.com/kaeza/minetest-intllib"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+git://github.com/kaeza/minetest-intllib.git")
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

