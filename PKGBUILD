# Maintainer: Br Anthony VanBerkum <anthonyvbop AT gmail DOT com>
pkgbase=lyluatex-git
pkgname=$pkgbase
pkgver=r43.5dcb34b
pkgrel=1
pkgdesc="Include lilypond scores in LuaLaTeX files."
url=https://github.com/jperon/lyluatex
arch=("all")
license=("MIT")
makedepends=("git")
depends=("texlive-core" "texlive-fontsextra" "texlive-bin" "texlive-formatsextra" "texlive-latexextra" "lilypond")
install=lyluatex.install
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
  cp LICENSE /usr/share/licenses/lyluatex-git || return 1
}
