# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=greywall-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Container-free, deny-by-default sandbox for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/GreyhavenHQ/greywall"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/greywall_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/greywall_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('1a340a9027a8ac71a33907f84cb8c39bbaa4a313ef7669ef2bc6f3aaafc5c7ff')
sha256sums_aarch64=('82bf6a5cf498431a9e14cdb6428a5cfc963c786ac6f84dd5f979c149d6b35c2a')

package() {
  install -Dm755 "greywall" "${pkgdir}/usr/bin/greywall"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
