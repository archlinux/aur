# Maintainer: Martino Pilia <martino.pilia@proton.me>
_pkgname=picotool
pkgname=${_pkgname}-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Tool for working with RP2040/RP2350 binaries"
arch=("x86_64")
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')
depends=()
makedepends=()
source=(
    "https://github.com/raspberrypi/pico-sdk-tools/releases/download/v${pkgver}-3/picotool-${pkgver}-a4-x86_64-lin.tar.gz"
    "https://raw.githubusercontent.com/raspberrypi/picotool/25aa087b2c517b4901874a99536e869d4d27b678/LICENSE.TXT"
)
md5sums=('034f611320f09e5ced5312e70f6a55ce'
         'db74c933ca4b8bb864b9088bec194057')

package() {
    cd "${srcdir}/${_pkgname}"

    install -D -m755 \
        "${srcdir}/${_pkgname}/picotool" \
        "${pkgdir}/usr/bin/picotool"

    install -D -m644 \
        "${srcdir}/LICENSE.TXT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

