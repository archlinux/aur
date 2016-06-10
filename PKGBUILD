# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=quotepas  
pkgver=1.0
pkgrel=3
pkgdesc="LaTeX style that can be used to insert passages from a database."
url="http://theoval.cmp.uea.ac.uk/~nlct/latex/packages"
arch=('any')
license=('LPPL')
depends=('texlive-core' 'perl')
source=(http://theoval.cmp.uea.ac.uk/~nlct/latex/packages/quotepas/$pkgname.tar.gz)
md5sums=('0c31eb7a8f1a2fcac2aa48ebd5cac034')
build() {
  cd $srcdir
  for _i in README sample.tex $pkgname.pdf database.qup
  do
    install -Dm644 ${_i} $pkgdir/usr/share/texmf/doc/$pkgname/${_i}
  done  
  for _i in $pkgname.ins $pkgname.dtx
  do
    install -Dm644 ${_i} $pkgdir/usr/share/texmf/tex/latex/$pkgname/${_i}
  done
  install -Dm755 $pkgname.pl $pkgdir/usr/bin/$pkgname
}
