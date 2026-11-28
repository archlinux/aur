# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=casvisor-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Bastion host for SSH, RDP, VNC and Telnet with web access and session recording"
arch=('x86_64' 'aarch64')
url="https://github.com/casvisor/casvisor"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/casvisor/casvisor/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/casvisor_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/casvisor_Linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('520d1074d9c2e36382d4b7791594bdec7aad70d7cc2507bff43bbecd51055a9e')
sha256sums_aarch64=('b7537103d93bd97fd99852af0fac79713c39ae5e35c9a84489ba9c4f8a308d6d')

package() {
  install -Dm755 "casvisor" "${pkgdir}/usr/bin/casvisor"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
