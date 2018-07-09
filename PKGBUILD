# Maintainer: 4leks4ndr <orthodox dot tk at gmail dot com>

pkgname=texlive-csltex
_pkgname=csltex
pkgver=2008.1116
_revnr=${pkgver#2008.}
pkgrel=3
pkgdesc="TeX Live - Package for typing of Church Slavonic texts in the standard HIP (HIP-9)"
arch=('any')
url="https://sites.google.com/site/csltex"
license=('LPPL')
depends=('texlive-core' 'texlive-langcyrillic')
optdepends=('texlive-irmologion')
source=("${url}/${_pkgname}-public.zip"
        "${pkgname}.maps"
        "language-local.dat"
        "language-local.def"
        "primer.tex"
        "primer.pdf"
        "${url}/sample2.pdf"
        "${url}/cslinstall.html")

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/share/texmf/tex/latex"
    install -dm755 "$pkgdir/var/lib/texmf/arch/installedpkgs"
    install -m644 "$pkgname.maps" "$pkgdir/var/lib/texmf/arch/installedpkgs/"
    echo "${_pkgname}" "${_revnr}" > "$pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${_revnr}.pkgs"
    install -Dm644 "$srcdir/doc/latex/csltex/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/doc/latex/csltex/csltex.pdf" "$pkgdir/usr/share/doc/$pkgname/csltex.pdf"
    install -Dm644 "$srcdir/primer.tex" "$pkgdir/usr/share/doc/$pkgname/primer.tex"
    install -Dm644 "$srcdir/primer.pdf" "$pkgdir/usr/share/doc/$pkgname/primer.pdf"
    install -Dm644 "$srcdir/sample2.pdf" "$pkgdir/usr/share/doc/$pkgname/advertising.pdf"
    install -Dm644 "$srcdir/cslinstall.html" "$pkgdir/usr/share/doc/$pkgname/cslinstall.html"
    install -Dm644 "$srcdir/language-local.dat" "$pkgdir/usr/share/texmf/tex/generic/config/language-local.dat"
    install -Dm644 "$srcdir/language-local.def" "$pkgdir/usr/share/texmf/tex/generic/config/language-local.def"
    cp -rf "$srcdir/tex/latex/csltex" "$pkgdir/usr/share/texmf/tex/latex/"
    # Fix permission
    chmod 644 "$srcdir/fonts/type1/csltex/AkathCUcs8.pfb"
    chmod 644 "$srcdir/fonts/type1/csltex/AkathUcs8.pfb"
    cp -rf "$srcdir/fonts" "$pkgdir/usr/share/texmf/"
}

md5sums=('717d9f4e4915646ab120556b6ffd6252'
         'ed29a7b59d63fef84174911108259331'
         '8d7062b8cdd7795b6fef77248c03ff1a'
         'ef125625e19cc7ed1eb5a4b22717f0cc'
         '6670664c8ce77dd4b0b983129341593a'
         '7730f78b926caf618be9165085b5404f'
         '67c97c1ee979482f4d2c303b3ab95c27'
         '2c736f1cd576904a416942ea7f2ee1f1')
