# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=ttf-kreativekorp-commodore-giana
pkgver=2011.02
pkgrel=2
pkgdesc="KreativeKorp's Commodore font based on Armin Gessert's game \"The Great Giana Sisters\": Giana."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/c64/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')

source=(
    'giana.zip::https://www.kreativekorp.com/swdownload/fonts/retro/giana.zip'
)
sha256sums=(
    '0c4fb657bef1fdd533688fe1f127f697170b179a72969872ca5003fcfd9a3f5b'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"

    find "${srcdir}" -type f -name 'Giana*.ttf' \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/${pkgbase}/" \;

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

