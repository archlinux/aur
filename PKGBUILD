# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=ttf-kreativekorp-apple2-bload
epoch=1
pkgver=2014.06
pkgrel=2
pkgdesc="KreativeKorp's Apple II standard bit patterns fonts: BLoad A1024 (lo-res graphics), and BLoad A8192 (hi-res graphics)."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/apple2/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')

source=(
    'bload.zip::https://www.kreativekorp.com/swdownload/fonts/retro/bload.zip'
)
sha256sums=(
    '0d87ff9408e7172038fe88a6ce3128af8cb716d5bce4a92cf7a33cd9b7458dd4'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"

    find "${srcdir}" -type f -name 'BLoad*.ttf' \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/${pkgbase}/" \;

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

