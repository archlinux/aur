# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=11.26.0
pkgrel=1
pkgdesc=" The Firebase Command Line Tools (bundled official standalone binary)"
arch=('x86_64')
url="https://github.com/firebase/firebase-tools"
license=('MIT')
conflicts=('firebase-tools')
options=('!strip')
source=(
    "firebase-tools-linux-11.26.0::https://github.com/firebase/firebase-tools/releases/download/v11.26.0/firebase-tools-linux"
    "LICENSE-11.26.0::https://github.com/firebase/firebase-tools/raw/v11.26.0/LICENSE"
    )
md5sums=(
    '40314dca39e47611d5d36463ccf2546f'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    binPath=${srcdir}/firebase-tools-linux-11.26.0
    chmod +x ${binPath}
    install -Dm644 "${srcdir}/LICENSE-11.26.0" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${binPath}" "${pkgdir}/usr/bin/firebase"
    rm ${srcdir}/firebase-tools-linux-*
    rm ${srcdir}/LICENSE-*
}
