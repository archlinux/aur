# Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgname=texlive-ewuthesis
pkgver=2015.11.13
pkgrel=1
pkgdesc="Style for Master's Thesis at Eastern Washington University"
license=('LPPL')
arch=(any)
depends=('texlive-core' 'texlive-htmlxml' 'texlive-plainextra' 'texlive-langextra')
url='https://github.com/oraac/texlive-ewuthesis'
source=("ewuthesis.tgz::https://github.com/oraac/texlive-ewuthesis/blob/master/packaged/ewuthesis.tgz?raw=true")
install=texlive-ewuthesis.install
sha256sums=('cafa89290da7fdf079751c6ec5f0e941cca1fdac6e1f057067c799f6e46481cc')

build() {
    cd "$srcdir/$pkgname"
    make clean
    make all
}

package() {
    cd "$srcdir/$pkgname"
    install -d -m775  "$pkgdir/usr/share/texmf/doc/latex/${pkgname}"
    install -d -m775  "$pkgdir/usr/share/texmf/tex/latex/${pkgname}"
    cp -R README.md \
          example.pdf \
          example     "$pkgdir/usr/share/texmf/doc/latex/${pkgname}"
    cp ewuthesis.cls  "$pkgdir/usr/share/texmf/tex/latex/${pkgname}"
    
}
