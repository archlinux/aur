# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgbase=ttf-kreativekorp-trs80
pkgname=(
    'ttf-kreativekorp-trs80-model1-original'
    'ttf-kreativekorp-trs80-model1-lowercase'
    'ttf-kreativekorp-trs80-model3'
    'ttf-kreativekorp-trs80-model4-original'
    'ttf-kreativekorp-trs80-model4-intl'
)
pkgver=2014.04
pkgrel=2
pkgdesc="KreativeKorp's font bundle themed after the TRS-80: Another Man's Treasure, complete with 22 different variations!"
arch=('any')
url='https://www.kreativekorp.com/software/fonts/trs80/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')

source=(
    'amtreasure.zip::https://www.kreativekorp.com/swdownload/fonts/retro/amtreasure.zip'
)
sha256sums=(
    '0ead11c7c07fd3306bc001a393088b973497ad1dad52bdc418c31da5881031e4'
)

_install_font() {
    local fontspec="$1"
    
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"

    find "${srcdir}" -type f -name "${fontspec}" \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/${pkgbase}/" \;

    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-trs80-model1-original() {
    pkgdesc="KreativeKorp's TRS-80 original Model 1 (I) font: Another Man's Treasure MIA."

    _install_font 'AnotherMansTreasureMIA*.ttf'
}

package_ttf-kreativekorp-trs80-model1-lowercase() {
    pkgdesc="KreativeKorp's TRS-80 lowercase Model 1 (I) font: Another Man's Treasure MIB."

    _install_font 'AnotherMansTreasureMIB*.ttf'
}

package_ttf-kreativekorp-trs80-model3() {
    pkgdesc="KreativeKorp's TRS-80 Model 3 (III) font: Another Man's Treasure MIII."

    _install_font 'AnotherMansTreasureMIII*.ttf'
}

package_ttf-kreativekorp-trs80-model4-original() {
    pkgdesc="KreativeKorp's TRS-80 original Model 4 font: Another Man's Treasure M4A."

    _install_font 'AnotherMansTreasureM4A*.ttf'
}

package_ttf-kreativekorp-trs80-model4-intl() {
    pkgdesc="KreativeKorp's TRS-80 international Model 4 font: Another Man's Treasure M4B."

    _install_font 'AnotherMansTreasureM4B*.ttf'
}

