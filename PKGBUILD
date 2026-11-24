# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazyskills-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Manage AI agent skills from a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/alvinunreal/lazyskills"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lazyskills_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lazyskills_Linux_arm64.tar.gz")
sha256sums_x86_64=('f6d35985219dd5ee8f1a6dcce281843e56b955586c6e9657cdaacae84e90a52f')
sha256sums_aarch64=('09890d00cad36b8cab6e39b43d5129afc0a5e5ba00d80da5faef75daf0791ddb')

package() {
  install -Dm755 "lazyskills" "${pkgdir}/usr/bin/lazyskills"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
