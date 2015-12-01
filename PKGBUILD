# Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgname=texlive-ewuthesis
pkgver=2015.12.01
pkgrel=1
pkgdesc="Style for Master's Thesis at Eastern Washington University"
license=('LPPL')
arch=(any)
depends=('texlive-core' 'texlive-htmlxml' 'texlive-plainextra' 'texlive-langextra')
url='https://github.com/oraac/texlive-ewuthesis'
source=("ewuthesis.tgz::https://github.com/oraac/texlive-ewuthesis/blob/master/packaged/ewuthesis.tgz?raw=true")
install=texlive-ewuthesis.install
sha256sums=('c2c693d896c8e464da132da6d8a4e9a6bea38fb52a166fd8f5ed02f6bd932ad9')

build() {
    cd "$srcdir/$pkgname"
    make
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
