# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=13.13.3
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
    "firebase-tools-linux-13.13.3::https://github.com/firebase/firebase-tools/releases/download/v13.13.3/firebase-tools-linux"
    "LICENSE-13.13.3::https://github.com/firebase/firebase-tools/raw/v13.13.3/LICENSE"
    )
md5sums=(
    '8ef17a0d8a42ed58019c21f16d407fd1'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    binPath=${srcdir}/firebase-tools-linux-13.13.3
    chmod +x ${binPath}
    install -Dm644 "${srcdir}/LICENSE-13.13.3" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${binPath}" "${pkgdir}/usr/bin/firebase"
    rm ${srcdir}/firebase-tools-linux-*
    rm ${srcdir}/LICENSE-*
}
