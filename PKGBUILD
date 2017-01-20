# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=dyplompwr
pkgver=2.0
pkgrel=2
_gitrel=v2.0
pkgdesc='Latex package with unofficial thesis template for students of Wrocław University of Technology'
arch=('any')
depends=('texlive-core' 'urw-garamond' 'urw-classico')
license=('MIT')
url='https://github.com/rkubosz/dyplompwr'
source=("https://github.com/rkubosz/dyplompwr/releases/download/$_gitrel/dyplompwr.zip"
        'license')
md5sums=('7acfcf67b6697133131fb61acf708d99'
         '532f9a8276206a404a50e40544238013')

package() {
    cd "$srcdir"
    texpath=usr/share/texmf/tex/latex
    mkdir -p "$pkgdir/$texpath/$pkgname"
    cp -R  "$pkgname" "$pkgdir/$texpath"
    install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/license"
    install -Dm644 doc/manual.pdf "$pkgdir/$texpath/doc/$pkgname/manual.pdf"
}
