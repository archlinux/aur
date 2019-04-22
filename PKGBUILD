# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=mkpdf
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple wrapper around pandoc and latexmk"
arch=('any')
url="https://github.com/seifferth/mkpdf"
license=('GPL3')
depends=('texlive-core' 'biber' 'pandoc')
optdepends=('python-langdetect: autodetect language of input document')
source=("https://github.com/seifferth/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('486d63953d9c6d68c61ba2c23ea71231')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make man
}

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver/mkpdf" "$pkgdir/usr/bin/mkpdf"
    install -Dm 755 "$srcdir/$pkgname-$pkgver/furbishtex/furbishtex" "$pkgdir/usr/bin/furbishtex"
    install -Dm 644 "$srcdir/$pkgname-$pkgver/furbishtex/default.sed" "$pkgdir/usr/lib/furbishtex/default.sed"
    install -Dm 644 "$srcdir/$pkgname-$pkgver/mkpdf.1.gz" "$pkgdir/usr/share/man/man1/mkpdf.1.gz"
}
