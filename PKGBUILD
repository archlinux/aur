# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-tray-bin'
pkgver=0.0.49
pkgrel=1
pkgdesc='System tray application for controlling Key Lights via keylightd'
url='https://github.com/jmylchreest/keylightd'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('keylightd-tray')
conflicts=('keylightd-tray')
depends=('gtk3' 'webkit2gtk-4.1')
optdepends=('keylightd: for local socket connection')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_${pkgver}_linux_arm64.tar.gz"
                 "${pkgname}_${pkgver}_aarch64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_${pkgver}_linux_arm64_sbom.spdx.json")
sha256sums_aarch64=('8516f2038e74815b384e8d108e9bcc92bd69d6183015cb141676a43c5c53d38d'
                    'ffdd067b5a1097cb1aa7d00be7d8f050cd3da33dc612513240bd1183385475d0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('a89b4219329048be4527e2963163f3610499a7af56e35bab01d19a63ab003db5'
                   'b9a4e35467a0c993c7581c981f7d63997e642a3d7ce3803cc882b221bfcd6232')

package() {
  # binary
  install -Dm755 "./keylightd-tray" "${pkgdir}/usr/bin/keylightd-tray"

  # license
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/keylightd-tray-bin/LICENSE"

  # documentation
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/keylightd-tray-bin/README.md"

  # SBOM
  install -Dm644 "${srcdir}/${pkgname}_${pkgver}_${CARCH}_sbom.spdx.json" "${pkgdir}/usr/share/doc/keylightd-tray-bin/sbom.spdx.json"
}
