# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=dyplompwr
pkgver=1.0
pkgrel=1
_gitrel=v1.0
pkgdesc='Latex package with unofficial thesis template for students of Wrocław University of Technology'
arch=('any')
depends=('texlive-core' 'urw-garamond' 'urw-classico')
license=('MIT')
url='https://github.com/rkubosz/dyplompwr'
source=("https://github.com/rkubosz/dyplompwr/releases/download/$_gitrel/dyplompwr.zip"
        'license')
md5sums=('be7a7957f5680cb44db2b0cb3f132a1d'
         '532f9a8276206a404a50e40544238013')

package() {
    cd "$srcdir"
    texpath=usr/share/texmf/tex/latex
    mkdir -p "$pkgdir/$texpath/$pkgname"
    cp -R  "$pkgname" "$pkgdir/$texpath"
    install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
