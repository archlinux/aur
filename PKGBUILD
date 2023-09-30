# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=12.6.1
pkgrel=1
pkgdesc=" The Firebase Command Line Tools (bundled official standalone binary)"
arch=('x86_64')
url="https://github.com/firebase/firebase-tools"
license=('MIT')
conflicts=('firebase-tools')
options=('!strip')
source=(
    "firebase-tools-linux-12.6.1::https://github.com/firebase/firebase-tools/releases/download/v12.6.1/firebase-tools-linux"
    "LICENSE-12.6.1::https://github.com/firebase/firebase-tools/raw/v12.6.1/LICENSE"
    )
md5sums=(
    'a9b214ecd34274cf2ae82ea8af533015'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    binPath=${srcdir}/firebase-tools-linux-12.6.1
    chmod +x ${binPath}
    install -Dm644 "${srcdir}/LICENSE-12.6.1" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${binPath}" "${pkgdir}/usr/bin/firebase"
    rm ${srcdir}/firebase-tools-linux-*
    rm ${srcdir}/LICENSE-*
}
