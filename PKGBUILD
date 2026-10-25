# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=ttf-kreativekorp-apple2-pr
pkgver=2020.04
pkgrel=3
pkgdesc="KreativeKorp's Apple II standard font: Print Char 21, and PR Number 3."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/apple2/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

# Patch taken from 'ttf-petme'.
makedepends=('wget')
DLAGENTS=('https::/usr/bin/wget -O %o %u')

source=(
    'pr.zip::https://www.kreativekorp.com/swdownload/fonts/retro/pr.zip'
)
sha256sums=(
    '39020933a8f1b5bf2869835fb8d2a4a9e134912ff128a12a8cc4162639a20aec'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -iname 'PR*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

