# Maintainer: Johannes Loher <johannes dot loher at fg4f dot de>

pkgname=ttf-cormorant
pkgver=3.500
pkgrel=1
pkgdesc="Cormorant fonts"
arch=('any')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
url='https://www.behance.net/gallery/28579883/Cormorant-an-open-source-display-font-family'
source=("https://github.com/CatharsisFonts/Cormorant/releases/download/v${pkgver}/Cormorant_Install_v${pkgver}.zip")
md5sums=('0dd323d62f037bae22bad83a45a1a7e6')
install=$pkgname.install
license=('custom: OFL')

package() {
    cd "${srcdir}/Cormorant_Install_v${pkgver}"
    install -dm755 "$pkgdir/usr/share/fonts/TTF"
    install -m644 "1. TrueType Font Files/"*.ttf "$pkgdir/usr/share/fonts/TTF/"

    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
