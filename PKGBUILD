# Maintainer: Siôn le Roux <sinisterstuf@gmail.com>
# Please submit issues or merge-requests at:
# https://github.com/sinisterstuf/PKGBUILD-latex-solarized

pkgname=latex-solarized-git
pkgver=r6.11b24e9
pkgrel=2
pkgdesc="Provides three LaTeX packages for using the Solarized theme in LaTeX code listings."
arch=('any')
url="https://github.com/jez/latex-solarized"
license=('MIT')
depends=('texlive-core')
makedepends=('git')
source=('git+https://github.com/jez/latex-solarized.git')
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  # Git, no tags available
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local latexdist='usr/share/texmf-dist/tex/latex'

  # Install all top-level .sty files into solarized/
  install -Dm644 -t$pkgdir/$latexdist/solarized/ $srcdir/${pkgname%-git}/*.sty
}

# vim:set ts=2 sw=2 et:
