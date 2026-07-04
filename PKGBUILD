# Maintainer: Martino Pilia <martino.pilia@proton.me>
_pkgname=picotool
pkgname=${_pkgname}-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Tool for working with RP2040/RP2350 binaries"
arch=("x86_64")
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')
depends=()
makedepends=()
source=(
    "https://github.com/raspberrypi/pico-sdk-tools/releases/download/v${pkgver}-0/picotool-${pkgver}-x86_64-lin.tar.gz"
    "https://raw.githubusercontent.com/raspberrypi/picotool/25aa087b2c517b4901874a99536e869d4d27b678/LICENSE.TXT"
)
sha256sums=('d8222dbb04e83427bcaef8466fe6e76b0e0193c3a140029934bd365dae49f61f'
            '483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6')

package() {
    cd "${srcdir}/${_pkgname}"

    install -D -m755 \
        "${srcdir}/${_pkgname}/picotool" \
        "${pkgdir}/usr/bin/picotool"

    install -D -m644 \
        "${srcdir}/LICENSE.TXT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

