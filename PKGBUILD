# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgbase=ttf-kreativekorp-commodore-petme
pkgname=(
    'ttf-kreativekorp-commodore-petme-pet'
    'ttf-kreativekorp-commodore-petme-c64'
    'ttf-kreativekorp-commodore-petme-c128'
)
pkgver=2020.05
pkgrel=1
pkgdesc="KreativeKorp's ultimate Commodore font bundle: Pet Me, with variations for the PET, the C64, and the C128."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/c64/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')
conflicts=('ttf-petme')

# Patch taken from 'ttf-petme'.
makedepends=('wget')
DLAGENTS=('https::/usr/bin/wget -O %o %u')

source=(
    'petme.zip::https://www.kreativekorp.com/swdownload/fonts/retro/petme.zip'
)
sha256sums=(
    '5479b901ef7b5f87bbd1a24ca13afe116f56450f97025ac6e28776f5a77edf6e'
)

package_ttf-kreativekorp-commodore-petme-pet() {
    pkgdesc="KreativeKorp's Commodore PET font: Pet Me, with 3 different variations."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f \! -name '*.txt' \! -name 'PetMe64*.ttf' \! -name 'PetMe128*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-commodore-petme-c64() {
    pkgdesc="KreativeKorp's Commodore 64 (C64) font: Pet Me 64, with 2 different variations."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'PetMe64*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-commodore-petme-c128() {
    pkgdesc="KreativeKorp's Commodore 128 (C128) font: Pet Me 128, with 2 different variations."

    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'PetMe128*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

