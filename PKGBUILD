# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-throwing_enhanced-git
_gitname=${pkgname%_enh*}
pkgver=48.61567b3
pkgrel=1
pkgdesc='Updated and enhanced throwing mod for Minetest (adds many bows and arrows).'
arch=('any')
url="https://gitlab.com/echoes91/throwing"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://gitlab.com/echoes91/throwing.git")
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

