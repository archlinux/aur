# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=ttf-kreativekorp-commodore-berkelium
pkgver=2011.02
pkgrel=3
pkgdesc="KreativeKorp's Commodore GEOS system font: Berkelium, based on BSW. Includes two variants: Berkelium 64 (menus and dialogs), and Berkelium 1541 (file icons)."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/c64/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')

source=(
    'berkelium.zip::https://www.kreativekorp.com/swdownload/fonts/retro/berkelium.zip'
)
sha256sums=(
    '6f120d32a240a272798134fb01ed954b51f9f8b1570f7788c9202080ec9749e2'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"

    find "${srcdir}" -type f -name 'Berkelium*.ttf' \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/${pkgbase}/" \;

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

