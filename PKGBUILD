# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=ttf-kreativekorp-apple2-shaston
epoch=1
pkgver=2011.02
pkgrel=1
pkgdesc="KreativeKorp's Apple II GS/OS system font: Shaston, in 4 different variants."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/apple2/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

# Patch taken from 'ttf-petme'.
makedepends=('wget')
DLAGENTS=('https::/usr/bin/wget -O %o %u')

source=(
    'shaston.zip::https://www.kreativekorp.com/swdownload/fonts/retro/shaston.zip'
)
sha256sums=(
    '5d732d6c283905fecb5eb177267d144906acabf5d309b29b9456858c01231ab4'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"
    for f in $(find "${srcdir}" -type f -name 'Shaston*.ttf'); do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${pkgbase}/"
    done

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

