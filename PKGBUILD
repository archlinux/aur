# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fullsend-bin
pkgver=0.57.1
pkgrel=1
pkgdesc="Autonomous agentic engineering CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/fullsend-ai/fullsend"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fullsend_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fullsend_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ee159b9609ebe24497a0381d5a6f4c42d898f669fba111ec547ec0d3a6334be0')
sha256sums_aarch64=('b20d6a3986bfb596c705a830c5e9df0f97c69dcb7b9e432eb1291c5ad4761c3a')

package() {
  install -Dm755 "fullsend" "${pkgdir}/usr/bin/fullsend"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
