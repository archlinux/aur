# Maintainer: Caleb Maclennan <caleb@alerque.com>

_project=quicksand
_upname=${_project^}Family
pkgbase=${_project}-font
pkgname=("ttf-$_project-variable") # "ttf-$_project"
pkgver=3.003
_sha=c0f7d6b2d2cb4e5477745d3eed096d7c1c4b05ba
pkgrel=2
pkgdesc='A sans serif typeface designed by Andrew Paglinawan using geometric shapes'
arch=('any')
url="https://github.com/andrew-paglinawan/${_upname}"
license=('OFL')
source=("$url/archive/$_sha/$pkgname-$pkgver.zip")
sha256sums=('a63d5d26ffb6edc13c85af6c326ee43c0741e969967831ba9639606b86494c06')

package_ttf-quicksand () {
    pkgdesc+=" (variable)"
    cd "${_upname}-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/statics/*.ttf
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-quicksand-variable () {
    pkgdesc+=" (variable)"
    cd "${_upname}-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/*\[*\].ttf
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
