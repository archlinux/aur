# Maintainer: Kherim Willems <kherimwillems at gmail dot com>

pkgname=cmu-sans-font-ttf
pkgver=1
pkgrel=2
pkgdesc="CMU Sans Serif is a sans-serif font, with regular and demi-condensed widths."
arch=('any')
url="https://fontlibrary.org/en/font/cmu-sans-serif"
license=('OFL')
depends=(fontconfig xorg-fonts-encodings xorg-mkfontdir)
source=("https://fontlibrary.org/assets/downloads/cmu-sans-serif/0da0d92e6bacf5e091c1ae85c4da581d/cmu-sans-serif.zip" $pkgname.install)
sha256sums=('a28376915ebe43e78e580ef9646663f08fe3f782767d1c11aeeb36ee2c712c23'
            '09a0c53ca10b0a5a1090a9f71631883fc9da8b08693184721a575c6e1f62bc3c')

install=$pkgname.install

package() {
    cd "$srcdir"
    for f in **/*.ttf; do
        fn=$(basename "$f")
        install -Dm444 "$f" "$pkgdir/usr/share/fonts/TTF/CMUSansSerif/$fn"
    done
    install -Dm644 "$srcdir/Sans/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
