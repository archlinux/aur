# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=drift-tui-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Lightweight project tracker for AI-assisted coding, with a TUI and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/snowtema/drift"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'drift-bin' 'drift-git')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/drift_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/drift_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('dc51aec0d46d524ac07ff9d853347fe3d6d29ab205716d24ed1249c482c5d13a')
sha256sums_aarch64=('09e1f13e0b8b535e142bd4521b816a88b8f3e9f91b984122757fc575dc938fa2')

package() {
  install -Dm755 "drift" "${pkgdir}/usr/bin/drift"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
