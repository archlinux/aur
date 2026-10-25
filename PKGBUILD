# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=ttf-kreativekorp-commodore-giana
pkgver=2011.02
pkgrel=1
pkgdesc="KreativeKorp's Commodore font based on Armin Gessert's game \"The Great Giana Sisters\": Giana."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/c64/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

# Patch taken from 'ttf-petme'.
makedepends=('wget')
DLAGENTS=('https::/usr/bin/wget -O %o %u')

source=(
    'giana.zip::https://www.kreativekorp.com/swdownload/fonts/retro/giana.zip'
)
sha256sums=(
    '0c4fb657bef1fdd533688fe1f127f697170b179a72969872ca5003fcfd9a3f5b'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'Giana*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

