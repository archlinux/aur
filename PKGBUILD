# Maintainer: Br Anthony VanBerkum <anthonyvbop AT gmail DOT com>
pkgbase=lyluatex-git
pkgname=$pkgbase
pkgver=r654.1008ec7
pkgrel=3
pkgdesc="Include lilypond scores in LuaLaTeX files."
url=https://github.com/jperon/lyluatex
arch=("any")
license=("MIT")
makedepends=("git")
depends=("texlive-core" "texlive-fontsextra" "texlive-bin" "texlive-formatsextra" "texlive-latexextra" "lilypond")
conflicts=("texlive-music")
source=("$pkgbase::git+https://github.com/jperon/lyluatex.git")
sha256sums=("SKIP")


pkgver() {
  cd "$srcdir/$pkgbase/"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$pkgbase/"
  mkdir -p $pkgdir/usr/share/texmf-dist/tex/luatex/lyluatex || return 1
  cp lyluatex.sty $pkgdir/usr/share/texmf-dist/tex/luatex/lyluatex || return 1
  cp lyluatex.lua $pkgdir/usr/share/texmf-dist/tex/luatex/lyluatex || return 1
  mkdir -p $pkgdir/usr/share/licenses/lyluatex-git || return 1
  cp LICENSE $pkgdir/usr/share/licenses/lyluatex-git || return 1
}
