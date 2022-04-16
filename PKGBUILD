# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: miwinning <miwinning@miwcloud.me>
pkgname=ttf-camingocode
pkgver=1.0
pkgrel=3
pkgdesc="A modern monospaced typeface designed for code editors"
arch=('any')
url="https://janfromm.de/typefaces/camingocode/"
license=('custom:CC-BY-ND 3.0')
source=("$pkgname-$pkgver.zip::https://janfromm.de/typefaces/camingocode/camingocode.zip")

package() {
    cd "$srcdir"

    files=(TTF/CamingoCode-BoldItalic.ttf TTF/CamingoCode-Bold.ttf TTF/CamingoCode-Italic.ttf TTF/CamingoCode-Regular.ttf)
    for f in "${files[@]}"; do
        install -Dm644 "$f" -t "$pkgdir/usr/share/fonts/TTF/"
    done

    install -Dm644 "readme.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('1ac164cbf2efdc5aacd75a0c77338acd080ebea785c60c81a0dfa0b68f485290')
