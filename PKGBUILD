pkgname=otf-nebula-sans
pkgver=1.010
pkgrel=0
pkgdesc='A versatile, modern, humanist sans-serif with a neutral aesthetic, designed for legibility in both digital and print applications.'
arch=('any')
url="https://nebulasans.com/"
license=('OFL-1.1-RFN')
source=("https://nebulasans.com/download/NebulaSans-${pkgver}.zip")
sha256sums=('a9b56ef15e24b6e8195af7457cc75f714ecf5501fc3c20a69f546c8f589e7bdb')

package() {
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/license.txt"

    fontdir="$pkgdir/usr/share/fonts/$pkgname/"
    install -d "$fontdir"
    for font in "$srcdir"/OTF/*.otf; do
        install -m644 "$font" "$fontdir"
    done
}
