# Maintainer: Kazuya Takei <myself@attakei.net>

pkgname=firebase-tools-bin
pkgver=15.19.1
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
    "firebase-tools-linux-15.19.1::https://github.com/firebase/firebase-tools/releases/download/v15.19.1/firebase-tools-linux"
    "LICENSE-15.19.1::https://github.com/firebase/firebase-tools/raw/v15.19.1/LICENSE"
    )
md5sums=(
    'dbfcd65f9464715017182f5d43aa61cd'
    '6ea8f4d1de9a164d33ffe95483a58af4'
    )

package() {
    binPath=${srcdir}/firebase-tools-linux-15.19.1
    chmod +x ${binPath}
    install -Dm644 "${srcdir}/LICENSE-15.19.1" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${binPath}" "${pkgdir}/usr/bin/firebase"
    rm ${srcdir}/firebase-tools-linux-*
    rm ${srcdir}/LICENSE-*
}
