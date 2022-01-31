# Maintainer: Anthony VanBerkum <anthonyvbop AT gmail DOT com>
# https://github.com/avbop/lyluatex-aur
pkgbase=luaoptions-git
pkgname=$pkgbase
pkgver=r765.f5fc56b
pkgrel=1
pkgdesc="Option handling for LuaLaTeX packages"
url=https://github.com/lualatex-tools/luaoptions
arch=("any")
license=("MIT")
makedepends=("git")
depends=()
source=("$pkgbase::git+https://github.com/lualatex-tools/luaoptions.git")
sha256sums=("SKIP")


pkgver() {
  cd "$srcdir/$pkgbase/"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$pkgbase/"
  mkdir -p $pkgdir/usr/share/texmf-dist/tex/luatex/luaoptions || return 1
  cp luaoptions.sty $pkgdir/usr/share/texmf-dist/tex/luatex/luaoptions || return 1
  cp luaoptions.lua $pkgdir/usr/share/texmf-dist/tex/luatex/luaoptions || return 1
  cp luaoptions-lib.lua $pkgdir/usr/share/texmf-dist/tex/luatex/luaoptions || return 1
  mkdir -p $pkgdir/usr/share/licenses/luaoptions-git || return 1
  cp LICENSE $pkgdir/usr/share/licenses/luaoptions-git || return 1
}
