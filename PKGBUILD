# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=dyplompwr
pkgver=2.2
pkgrel=1
pkgdesc='Latex package with unofficial thesis template for students of Wrocław
University of Technology'
arch=('any')
depends=('texlive-core' 'urw-garamond' 'urw-classico' 'texlive-langpolish')
license=('MIT')
url='https://github.com/rkubosz/dyplompwr'
source=("https://github.com/rkubosz/dyplompwr/archive/v$pkgver.zip")
sha256sums=('104ead090f1cdae1d6c7b524b0b5c432541a4ffaa5ed0e5dec5043ec3ab439b8')

package() {
    texpath=usr/share/texmf-dist/tex/latex
    mkdir -p "$pkgdir/$texpath"
    cp -r "$srcdir/$pkgname-$pkgver/dyplompwr" "$pkgdir/$texpath"
    install -Dm644 "$srcdir/$pkgname-$pkgver/license" "$pkgdir/usr/share/licenses/$pkgname/license"
    install -Dm644 "$srcdir/$pkgname-$pkgver/doc/manual.pdf" "$pkgdir/$texpath/doc/$pkgname/manual.pdf"
}
