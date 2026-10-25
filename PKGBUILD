# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=ttf-kreativekorp-apple2-berkeliumii
epoch=1
pkgver=2011.02
pkgrel=2
pkgdesc="KreativeKorp's Apple II GEOS system font: Berkelium II, in 2 different variants."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/apple2/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')

source=(
    'berkeliumii.zip::https://www.kreativekorp.com/swdownload/fonts/retro/berkeliumii.zip'
)
sha256sums=(
    '46e35f90318969b495b74329cbbc1fc1fd5008a4f92d9f583f207e462c265ccc'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"

    find "${srcdir}" -type f -name 'BerkeliumII*.ttf' \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/${pkgbase}/" \;

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

