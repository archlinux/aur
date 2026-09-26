# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=15.30.2
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
    "firebase-tools-linux-15.30.2::https://github.com/firebase/firebase-tools/releases/download/v15.30.2/firebase-tools-linux"
    "LICENSE-15.30.2::https://github.com/firebase/firebase-tools/raw/v15.30.2/LICENSE"
    )
md5sums=(
    '4ee6405c6021fbe1628b917ae7165078'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    binPath=${srcdir}/firebase-tools-linux-15.30.2
    chmod +x ${binPath}
    install -Dm644 "${srcdir}/LICENSE-15.30.2" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${binPath}" "${pkgdir}/usr/bin/firebase"
    rm ${srcdir}/firebase-tools-linux-*
    rm ${srcdir}/LICENSE-*
}
