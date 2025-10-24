# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=14.22.0
pkgrel=1
pkgdesc=" The Firebase Command Line Tools (bundled official standalone binary)"
arch=('x86_64')
url="https://github.com/firebase/firebase-tools"
license=('MIT')
depends=(
  'glibc'
  
  'gcc-libs'
  
)
conflicts=('firebase-tools')
options=('!strip' '!debug')
source=(
    "firebase-tools-linux-14.22.0::https://github.com/firebase/firebase-tools/releases/download/v14.22.0/firebase-tools-linux"
    "LICENSE-14.22.0::https://github.com/firebase/firebase-tools/raw/v14.22.0/LICENSE"
    )
md5sums=(
    'b40bcc9bd465fc551c35bfe56c64db28'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    binPath=${srcdir}/firebase-tools-linux-14.22.0
    chmod +x ${binPath}
    install -Dm644 "${srcdir}/LICENSE-14.22.0" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${binPath}" "${pkgdir}/usr/bin/firebase"
    rm ${srcdir}/firebase-tools-linux-*
    rm ${srcdir}/LICENSE-*
}
