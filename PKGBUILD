# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=13.8.0
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
    "firebase-tools-linux-13.8.0::https://github.com/firebase/firebase-tools/releases/download/v13.8.0/firebase-tools-linux"
    "LICENSE-13.8.0::https://github.com/firebase/firebase-tools/raw/v13.8.0/LICENSE"
    )
md5sums=(
    '39f48b3f4292a449b9028575c9f4e400'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    binPath=${srcdir}/firebase-tools-linux-13.8.0
    chmod +x ${binPath}
    install -Dm644 "${srcdir}/LICENSE-13.8.0" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${binPath}" "${pkgdir}/usr/bin/firebase"
    rm ${srcdir}/firebase-tools-linux-*
    rm ${srcdir}/LICENSE-*
}
