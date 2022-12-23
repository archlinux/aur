# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=11.19.0
pkgrel=1
pkgdesc=" The Firebase Command Line Tools (bundled official standalone binary)"
arch=('x86_64')
url="https://github.com/firebase/firebase-tools"
license=('MIT')
conflicts=('firebase-tools')
options=('!strip')
source=(
    "firebase-11.19.0::https://github.com/firebase/firebase-tools/releases/download/v11.19.0/firebase-tools-linux"
    "license-11.19.0::https://github.com/firebase/firebase-tools/raw/v11.19.0/LICENSE"
    )
md5sums=(
    'd5e7916ea0bff99608d0fff7e8c6f3b2'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    chmod +x ${srcdir}/firebase-11.19.0
    install -Dm644 "${srcdir}/LICENSE-11.19.0" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/firebase-11.19.0" "${pkgdir}/usr/bin/firebase"
}
