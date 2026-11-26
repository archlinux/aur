# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ratchet-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Secure CI/CD workflows by pinning versions"
arch=('x86_64' 'aarch64')
url="https://github.com/sethvargo/ratchet"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ratchet_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ratchet_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e1fb026d93d84020cc4354dd3fdc667f6e03f04d017edcc4a2bddfc78c1efb56')
sha256sums_aarch64=('15e6f7f00b53dd95001487bf5651d9dcd48d61dc22cfc945df375419c6000b4c')

package() {
  install -Dm755 "ratchet" "${pkgdir}/usr/bin/ratchet"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
