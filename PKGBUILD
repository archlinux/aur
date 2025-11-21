# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-tray-bin'
pkgver=0.0.46
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
sha256sums_aarch64=('b93c1fcf5972ff7e058a02e89715a9f66e59b307e738a43dcb6609cec59ea543'
                    '979913478262f6ac74f89e24195556c22ed95ddc100ba1ba3850c6f71fa63ee1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_v${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd-tray_v${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('69e0965544be6072dcc3cbadd51b8d328744f4739838c5d825eeea5fb0388e12'
                   '0e0a2f2a89a4cac6ca04d872b776818e47273c59504a725ef5f7551578667fd0')

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
