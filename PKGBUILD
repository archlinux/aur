# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-tray-bin'
pkgver=0.1.4
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
sha256sums_aarch64=('d590c736a10606b2cdc8d0384099da57b0d4711e0d0535c15163fb935fec62e1'
                    'ef76b784eeca7252147bc979ad714886ad84305b79f14c4100f12d81da756723')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('a464c936fb85c7dffc2f6f30e386ebcc036952045637c2896f8c2d4daa36d157'
                   'a1e81c7576beb6320eb49853d16a2fb54aee2b1e9cb596c43664f920791ca816')

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
