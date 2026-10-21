# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=latex-pdfpages
_name=${pkgname#latex-}
pkgver=0.6h
pkgrel=2
pkgdesc="Inclusion of external multi-page PDF documents in LATEX documents"
arch=(any)
url="https://ctan.org/pkg/pdfpages"
license=(LPPL-1.3c+)
depends=(texlive-latexrecommended)
source=($_name-$pkgver.zip::https://mirrors.ctan.org/macros/latex/contrib/$_name.zip)
install=$pkgname.install
sha256sums=('d3dc0cf8da81a64578e26a2cac5fcb4bc72346edf3513237555187daaf6a36da')

build() {
  cd "$_name"
  latex -interaction=nonstopmode -halt-on-error pdfpages.ins
}

package() {
  cd "$_name"
  install -Dm644 -t "$pkgdir/usr/share/texmf/tex/latex/$_name" *.sty *.def
  install -Dm644 -t "$pkgdir/usr/share/texmf/source/latex/$_name" *.dtx *.ins
  install -Dm644 -t "$pkgdir/usr/share/texmf/doc/latex/$_name" README *.pdf *.tex
}
