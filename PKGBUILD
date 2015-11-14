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
sha256sums=('b27b76d9b0b3019cfb1f9cf691ebe5f551f1a906e22953058809612a5eed0b32')

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
