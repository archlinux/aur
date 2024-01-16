# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='sdcardformatter'
pkgver='1.0.2'
pkgrel=1
pkgdesc="SD Memory Card Formatter for Linux"
arch=('x86_64' 'aarch64')
url="https://www.sdcard.org/downloads/sd-memory-card-formatter-for-linux/"
license=('custom')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
source_x86_64=("https://sdcard.org/downloads/formatter/eula_linux/SDCardFormatterv${pkgver}_Linux_x86_64.tgz")
source_aarch64=("https://sdcard.org/downloads/formatter/eula_linux/SDCardFormatterv${pkgver}_Linux_ARM64.tgz")
sha256sums_x86_64=('3d961085954abeb764265184a92c1114aa4cef9cf12ca3c3337b6b63e0dbe0fb')
sha256sums_aarch64=('8695a0f441129845136afee01d94d6dbccbe87ba7c904f045f2af0613f9a1978')

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
