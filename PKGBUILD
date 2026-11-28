# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ironclad-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Command-line password manager"
arch=('x86_64')
url="https://github.com/dmulholl/ironclad"
license=('0BSD')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dmulholl/ironclad/v${pkgver}/license.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/ironclad-linux-amd64.zip")
sha256sums=('938fdf60f8bb2ccb7bf77de3a207080591c0122a6dabf1249c55f5516d4104a9')
sha256sums_x86_64=('08cbf486427577c55af3a5aa75d7f29a1202eba61de48dee72c3c20e17208fd1')

package() {
  install -Dm755 "ironclad-linux-amd64/ironclad" "${pkgdir}/usr/bin/ironclad"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
