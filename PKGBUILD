# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=diffpane-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Real-time TUI diff viewer for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/astro-han/diffpane"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/diffpane_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/diffpane_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8747f0426336a4d68befb556ccc7299d864e933cb5ab22f61176de3f584382a5')
sha256sums_aarch64=('de557ab837a2b7bffc724ceb7eebd4e2147b4bbd0c3afdcfbd8a9b0ea4e19c27')

package() {
  install -Dm755 "diffpane" "${pkgdir}/usr/bin/diffpane"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
