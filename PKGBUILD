# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=11.8.0
pkgrel=1
pkgdesc=" The Firebase Command Line Tools (bundled official standalone binary)"
arch=('x86_64')
url="https://github.com/firebase/firebase-tools"
license=('MIT')
conflicts=('firebase-tools')
options=('!strip')
source=(
    "https://github.com/firebase/firebase-tools/releases/download/v11.8.0/firebase-tools-linux"
    "https://github.com/firebase/firebase-tools/raw/v11.8.0/LICENSE"
    )
md5sums=(
    '24d8bcf727b2fa5f2367d1384a314951'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    name=${pkgname/-bin/}-linux
    chmod +x ${srcdir}/${name}
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${name}" "${pkgdir}/usr/bin/firebase"
}
