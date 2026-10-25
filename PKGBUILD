# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=ttf-kreativekorp-apple2-berkeliumii
epoch=1
pkgver=2011.02
pkgrel=1
pkgdesc="KreativeKorp's Apple II GEOS system font: Berkelium II, in 2 different variants."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/apple2/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

# Patch taken from 'ttf-petme'.
makedepends=('wget')
DLAGENTS=('https::/usr/bin/wget -O %o %u')

source=(
    'berkeliumii.zip::https://www.kreativekorp.com/swdownload/fonts/retro/berkeliumii.zip'
)
sha256sums=(
    '46e35f90318969b495b74329cbbc1fc1fd5008a4f92d9f583f207e462c265ccc'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'BerkeliumII*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

