# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=leankg-bin
pkgver=0.38.0
pkgrel=1
pkgdesc="Lean code knowledge graph for AI agents that saves tokens"
arch=('x86_64' 'aarch64')
url="https://github.com/FreePeak/LeanKG"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FreePeak/LeanKG/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/leankg-linux-amd64.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/leankg-linux-arm64.tgz")
sha256sums=('431e055b00bd929b2f5ea93082396d76fce779a2bb1173b8fc738dc82683463d')
sha256sums_x86_64=('9847053143e1c079de67ef3be4f9b1a9dcf08871909aa7103071b18acd788b9e')
sha256sums_aarch64=('e7deaf0bd8ad829b4da73354b0dce20dd61a79b32b713b8f3eaaf09a4edc4447')

package() {
  install -Dm755 "leankg" "${pkgdir}/usr/bin/leankg"
  install -Dm755 "leankg-embed" "${pkgdir}/usr/bin/leankg-embed"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
