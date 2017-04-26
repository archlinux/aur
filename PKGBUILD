# Maintainer: Aleksandr Boyko <brdcom@yandex.ru>
pkgname=texlive-csltex
_pkgname=csltex
pkgver=2007.0712
pkgrel=5
pkgdesc="A LaTeX package for typing of Church Slavonic texts in the standard HIP (HIP-9)"
arch=('any')
url="https://sites.google.com/site/csltex"
license=('LPPL')
depends=('texlive-core')
source=("${url}/${_pkgname}-public.zip"
        "${pkgname}.maps"
        "language-local.dat"
        "language-local.def"
        "primer.tex"
        "primer.pdf")

package() {
    install -Dm644 "$srcdir/doc/latex/csltex/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/doc/latex/csltex/csltex.pdf" "$pkgdir/usr/share/doc/$pkgname/csltex.pdf"
    install -Dm644 "$srcdir/doc/latex/csltex/primer.tex" "$pkgdir/usr/share/doc/$pkgname/primer.tex"
    install -Dm644 "$srcdir/doc/latex/csltex/primer.pdf" "$pkgdir/usr/share/doc/$pkgname/primer.pdf"
    install -dm755 "$pkgdir/usr/local/share/texmf/tex/latex"
    install -Dm644 "$srcdir/language-local.dat" "$pkgdir/usr/local/share/texmf/tex/generic/config/language-local.dat"
    install -Dm644 "$srcdir/language-local.def" "$pkgdir/usr/local/share/texmf/tex/generic/config/language-local.def"
    cp -rf "$srcdir/tex/latex/csltex" "$pkgdir/usr/local/share/texmf/tex/latex/"
    cp -rf "$srcdir/fonts" "$pkgdir/usr/local/share/texmf/"
}

md5sums=('717d9f4e4915646ab120556b6ffd6252'
         '2428a571310206530cc9c2f466e79227'
         '8d7062b8cdd7795b6fef77248c03ff1a'
         'ef125625e19cc7ed1eb5a4b22717f0cc'
         '6670664c8ce77dd4b0b983129341593a'
         '7730f78b926caf618be9165085b5404f')
