# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=salvanza_client-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Backup client for Proxmox Backup Server"
arch=('x86_64' 'aarch64')
url="https://github.com/Salvanza/salvanza_client"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/salvanza_client_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/salvanza_client_Linux_arm64.tar.gz")
sha256sums_x86_64=('e36f95188363231cfecfc8d6283a6a29a725e7227fe698118c2b97d3131b399f')
sha256sums_aarch64=('cc4f18b62a6286b6650abb157344e0cdada6c4d0f799ee2f93d3e0e430f28354')

package() {
  install -Dm755 "salvanza-cli" "${pkgdir}/usr/bin/salvanza-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
