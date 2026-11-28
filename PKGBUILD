# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazyskills-bin
pkgver=1.2.1
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
sha256sums_x86_64=('2276ee632e236a7563e8a44f319485a679004413a768173065dc9d369cc30719')
sha256sums_aarch64=('386da4cd173daf93562c4233795a5828ed535abc0627a540e2f57533b352d090')

package() {
  install -Dm755 "lazyskills" "${pkgdir}/usr/bin/lazyskills"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
