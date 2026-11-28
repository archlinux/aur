# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=github_exporter-bin
pkgver=21.3.0
pkgrel=1
pkgdesc="Prometheus exporter for GitHub"
arch=('x86_64' 'aarch64')
url="https://github.com/promhippie/github_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/github-exporter-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/github-exporter-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('83a1a1c9a2a210ef723ce502d90d557016c87e81d06fae8ee1e4b49293bbd314')
sha256sums_aarch64=('402fc188e144f83cdd27d88672bcf64109a175317a6d940d95d1938e9b1cf4ab')

package() {
  install -Dm755 "github_exporter" "${pkgdir}/usr/bin/github_exporter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
