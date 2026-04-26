# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=15.15.0
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
    "firebase-tools-linux-15.15.0::https://github.com/firebase/firebase-tools/releases/download/v15.15.0/firebase-tools-linux"
    "LICENSE-15.15.0::https://github.com/firebase/firebase-tools/raw/v15.15.0/LICENSE"
    )
md5sums=(
    '4632a79032b944da786b2e2b08cf9148'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    binPath=${srcdir}/firebase-tools-linux-15.15.0
    chmod +x ${binPath}
    install -Dm644 "${srcdir}/LICENSE-15.15.0" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${binPath}" "${pkgdir}/usr/bin/firebase"
    rm ${srcdir}/firebase-tools-linux-*
    rm ${srcdir}/LICENSE-*
}
