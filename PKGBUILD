# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-tray-bin'
pkgver=0.2.1
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
sha256sums_aarch64=('8c56b9557cb260939eb15e5013039759c6616660299c6e717d3fc9a604d2842e'
                    '872d24061546b425f8b9f8070613ddd866a390e6dcbbce60f797cdcaa529c8e1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('ecf14571587166143e1b9db77828e75b0db08e9272b83e0c06a0fe3a9ab40be5'
                   '3aaf944f0aa7a18a3d390725e1f874e53773b42a3b052222c9249193c1bc60cc')

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
