# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-tray-bin'
pkgver=0.0.43
pkgrel=1
pkgdesc='System tray application for controlling Key Lights via keylightd'
url='https://github.com/jmylchreest/keylightd'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('keylightd-tray')
conflicts=('keylightd-tray')
depends=('gtk3' 'webkit2gtk-4.1')
optdepends=('keylightd: for local socket connection')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_v${pkgver}_linux_arm64.tar.gz"
                 "${pkgname}_${pkgver}_aarch64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_v${pkgver}_linux_arm64_sbom.spdx.json")
sha256sums_aarch64=('fe68b9787ace4cd5964c645cefeba0d08aabf6795e6e13a8d6c81956cb541352'
                    'fb26772223608dc61f12dbf3760a76d5c97c0dd887f005cf045d08775b41f1fc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_v${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_v${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('5c123af75564110a020c6ae9343a7e65df2862d3f15050b3e66bc8067c295388'
                   'd9a0164b8618af76e1856dd1d9ea8660db4d9e016fd44457eac94f69c2aeef73')

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
