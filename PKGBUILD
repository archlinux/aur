# Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgname=texlive-ewuthesis
pkgver=2015.11.11
pkgrel=1
pkgdesc="Style for Master's Thesis at Eastern Washington University"
license=('LPPL')
arch=(any)
depends=('texlive-core' 'texlive-htmlxml' 'texlive-plainextra' 'texlive-langextra')
url='https://github.com/oraac/texlive-ewuthesis'
source=("ewuthesis-${pkgver}.tgz::https://github.com/oraac/texlive-ewuthesis/blob/master/packaged/ewuthesis-${pkgver}.tgz?raw=true")
install=texlive-ewuthesis.install
sha256sums=('51be7716606f9d78a2277a54ced8afc93104186bb55b8243ed1fddd63d25b228')

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
