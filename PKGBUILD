# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=12.0.0
pkgrel=1
pkgdesc=" The Firebase Command Line Tools (bundled official standalone binary)"
arch=('x86_64')
url="https://github.com/firebase/firebase-tools"
license=('MIT')
conflicts=('firebase-tools')
options=('!strip')
source=(
    "firebase-tools-linux-12.0.0::https://github.com/firebase/firebase-tools/releases/download/v12.0.0/firebase-tools-linux"
    "LICENSE-12.0.0::https://github.com/firebase/firebase-tools/raw/v12.0.0/LICENSE"
    )
md5sums=(
    'a39b269d1bb63bf64cd96a41357b7f47'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    binPath=${srcdir}/firebase-tools-linux-12.0.0
    chmod +x ${binPath}
    install -Dm644 "${srcdir}/LICENSE-12.0.0" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${binPath}" "${pkgdir}/usr/bin/firebase"
    rm ${srcdir}/firebase-tools-linux-*
    rm ${srcdir}/LICENSE-*
}
