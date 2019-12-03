# Maintainer: Kherim Willems <kherimwillems at gmail dot com>

pkgname=cmu-sans-font-ttf
pkgver=1
pkgrel=1
pkgdesc="CMU Sans Serif is a sans-serif font, with regular and demi-condensed widths."
arch=('any')
url="https://fontlibrary.org/en/font/cmu-sans-serif"
license=('OFL')
depends=()
source=("https://fontlibrary.org/assets/downloads/cmu-sans-serif/0da0d92e6bacf5e091c1ae85c4da581d/cmu-sans-serif.zip")
md5sums=('0da0d92e6bacf5e091c1ae85c4da581d')

package() {
    cd "$srcdir"
    for f in **/*.ttf; do
        fn=$(basename "$f")
        install -Dm644 "$f" "$pkgdir/usr/share/fonts/TTF/$fn"
    done
    install -Dm644 "$srcdir/Sans/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
