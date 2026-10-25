# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=ttf-kreativekorp-apple2-pr
pkgver=2020.04
pkgrel=4
pkgdesc="KreativeKorp's Apple II standard font: Print Char 21, and PR Number 3."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/apple2/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')

source=(
    'pr.zip::https://www.kreativekorp.com/swdownload/fonts/retro/pr.zip'
)
sha256sums=(
    '39020933a8f1b5bf2869835fb8d2a4a9e134912ff128a12a8cc4162639a20aec'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"

    find "${srcdir}" -type f -iname 'PR*.ttf' \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/${pkgbase}/" \;

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

