# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=thesis
pkgver=1.0
pkgrel=3
pkgdesc="Two LaTeX classes for bigger, thesis-like documents"
url="http://dante.ctan.org/CTAN/help/Catalogue/entries/thesis.html#Visit"
arch=('any')
license=('LPPL')
depends=('texlive-core')
install=thesis.install
source=(http://dante.ctan.org/CTAN/macros/latex/contrib/$pkgname.zip)
md5sums=('8c6e19dfbbd919c84abf939f12d8a8b9')

build() {
  cd $srcdir/$pkgname
  yes | latex install.01 || return 1
  yes | latex install.ndx || return 1
  install -Dm644 makendx.sty \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/makendx.sty || return 1
  install -Dm644 thema.sty \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/thema.sty || return 1
  install -Dm644 thema.cls \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/thema.cls || return 1
  install -Dm644 thesis.sty \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/thesis.sty || return 1
  install -Dm644 thesis.cls \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/thesis.cls || return 1
  install -Dm644 makendx.ist \
    $pkgdir/usr/share/texmf/makeindex/$pkgname/makendx.ist || return 1
  install -Dm644 thesis.pdf \
    $pkgdir/usr/share/texmf/doc/$pkgname/thesis.pdf || return 1
}
