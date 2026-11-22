# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fastcards-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="A CLI spaced-repetition flashcard study tool"
arch=('x86_64' 'aarch64')
url="https://github.com/indium114/fastcards"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/indium114/fastcards/${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/fastcards_Linux_x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/fastcards_Linux_arm64")
sha256sums=('da0978e7ef06fe0df9a199ea21f5e3466295bb3e78123c898f8098486dda14a8')
sha256sums_x86_64=('a42b0a585e83b5621a68b2dbbb14c5f91acf10ecbfcf50678a35abd36686a7a9')
sha256sums_aarch64=('c6dcca0506da183618f3c837b7e199333ccb4983957e31fc981bde31f8f17f4f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fastcards"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
