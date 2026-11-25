# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cf-vps-monitor-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Server metrics agent for the CF VPS Monitor dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/kadidalax/cf-vps-monitor"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kadidalax/cf-vps-monitor/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/cf-vps-monitor-agent-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/cf-vps-monitor-agent-linux-arm64")
sha256sums=('e0fce3ad32b0de12548a464c2cc4f338ad65a29f941eca7853a54a5605bb6f51')
sha256sums_x86_64=('b6b5c1d6f1df2fe0471b140102ca6991a242a001195bfcfcdc1d036a3dbb9e2a')
sha256sums_aarch64=('d47714c1e114f61882dbebce3d66f00544729fe1e60cb1fe801f1e8e18ef6f62')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cf-vps-monitor-agent"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
