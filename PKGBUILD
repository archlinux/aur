# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tsflow-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Network flow visualizer for Tailscale"
arch=('x86_64' 'aarch64')
url="https://github.com/rajsinghtech/tsflow"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tsflow-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tsflow-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('b9fd618d65b8ed630cf87d96db3304b50ee559127f7c51267f207f7a83653ec9')
sha256sums_aarch64=('2ae9fdb9e861cebe0fb08c6b0bf68e393aad3090c811e5eb62f3ed8b70806488')

package() {
  install -Dm755 "tsflow" "${pkgdir}/usr/bin/tsflow"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
