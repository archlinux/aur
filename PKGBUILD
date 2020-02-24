# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=dyplompwr
pkgver=2.1
pkgrel=1
pkgdesc='Latex package with unofficial thesis template for students of Wrocław
University of Technology'
arch=('any')
depends=('texlive-core' 'urw-garamond' 'urw-classico')
license=('MIT')
url='https://github.com/rkubosz/dyplompwr'
source=("https://github.com/rkubosz/dyplompwr/archive/v$pkgver.zip")
sha256sums=('b87b9e96ec9a69d54c3c18620e7a59bc396fefdfaae6d0f3bc9adc7282599adc')

package() {
    texpath=usr/share/texmf/tex/latex
    mkdir -p "$pkgdir/$texpath"
    cp -r "$srcdir/$pkgname-$pkgver/dyplompwr" "$pkgdir/$texpath"
    install -Dm644 "$srcdir/$pkgname-$pkgver/license" "$pkgdir/usr/share/licenses/$pkgname/license"
    install -Dm644 "$srcdir/$pkgname-$pkgver/doc/manual.pdf" "$pkgdir/$texpath/doc/$pkgname/manual.pdf"
}
