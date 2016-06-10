# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=thesis
pkgver=1.0
pkgrel=5
pkgdesc="Two LaTeX classes for bigger, thesis-like documents"
url="http://dante.ctan.org/CTAN/help/Catalogue/entries/thesis.html#Visit"
arch=('any')
license=('LPPL')
depends=('texlive-core')
source=(http://dante.ctan.org/CTAN/macros/latex/contrib/$pkgname.zip)
md5sums=('8c6e19dfbbd919c84abf939f12d8a8b9')

build() {
  cd $srcdir/$pkgname
  yes|latex install.01 
  yes|latex install.ndx 
}
package() {
  cd $srcdir/$pkgname
  install -Dm644 makendx.sty \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/makendx.sty 
  install -Dm644 thema.sty \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/thema.sty 
  install -Dm644 thema.cls \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/thema.cls 
  install -Dm644 thesis.sty \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/thesis.sty
  install -Dm644 thesis.cls \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname/thesis.cls
  install -Dm644 makendx.ist \
    $pkgdir/usr/share/texmf/makeindex/$pkgname/makendx.ist
  install -Dm644 thesis.pdf \
    $pkgdir/usr/share/texmf/doc/$pkgname/thesis.pdf
}
