# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: miwinning <miwinning@miwcloud.me>
pkgname=ttf-camingocode
pkgver=1.0
pkgrel=2
pkgdesc="A modern monospaced typeface designed for code editors"
arch=('any')
url="http://www.janfromm.de/typefaces/camingomono/overview/"
license=('custom:CC-BY-ND 3.0')
source=("$pkgname-$pkgver.zip::http://janfromm.de/_data/downloads/CamingoCode-v$pkgver.zip")

package() {
    cd "$srcdir"

    files=(CamingoCode-BoldItalic.ttf CamingoCode-Bold.ttf CamingoCode-Italic.ttf CamingoCode-Regular.ttf)
    for f in "${files[@]}"; do
        install -Dm644 "$f" -t "$pkgdir/usr/share/fonts/TTF/"
    done

    install -Dm644 "readme.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('13b188ca8d1b5fe2c3ba880771f20a6faac550405ae98d12edd46240f8896714')
