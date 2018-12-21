# Maintainer: ber532k <ber532k@gmx.de>
pkgname=mkpdf
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple wrapper around pandoc and latexmk"
arch=('any')
url="https://github.com/ber532k/mkpdf"
license=('GPL3')
depends=('texlive-core' 'biber' 'pandoc')
optdepends=('python-langdetect: autodetect language of input document')
source=("https://github.com/ber532k/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2c68d9dace8a75afa12b5e32e9e71f71')

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
