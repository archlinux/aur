# Maintainer: imcb <irismessage@protonmail.com>

pkgname='sdcardformatter'
pkgver=1.0.3
pkgrel=1
pkgdesc='SD Memory Card Formatter for Linux'
arch=('x86_64' 'aarch64')
url='https://www.sdcard.org/downloads/sd-memory-card-formatter-for-linux/'
license=('LicenseRef-sdcardformatter')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(
    'format_sd'
)
conflicts=()
source_x86_64=(
    "https://sdcard.org/downloads/formatter/eula_linux/SDCardFormatterv${pkgver}_Linux_x86_64.tgz"
)
source_aarch64=(
    "https://sdcard.org/downloads/formatter/eula_linux/SDCardFormatterv${pkgver}_Linux_ARM64.tgz"
)
sha256sums_x86_64=('4deb49e3e4fed03839628bbdb40169ffed76fe677c380ca6f4262e0f1ce5d6b0')
sha256sums_aarch64=('7c3375d79ef572afdf9dd2e4c7cc1762f040abb389154a03f8187d1edad5a4d7')

case ${CARCH} in
    "x86_64")
     _target="x86_64"
     ;;
    "aarch64")
     _target="ARM64"
     ;;
esac

package() {
    cd "SDCardFormatterv${pkgver}_Linux_${_target}"
    
    install -D -t "${pkgdir}/usr/bin/" "format_sd"
    install -Dm644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
