# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-mobf_core-git
_gitname=${pkgname%-git*}
pkgver=630.fcc2553
pkgrel=1
pkgdesc='Minetest MOB Framework'
arch=('any')
url="https://github.com/sapier/mobf_core"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+git://github.com/sapier/mobf_core.git")
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

