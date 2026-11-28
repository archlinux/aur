# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pai-sho-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="Peer-to-peer port forwarding between your machines over iroh"
arch=('x86_64' 'aarch64')
url="https://github.com/cablehead/pai-sho"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cablehead/pai-sho/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pai-sho-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pai-sho-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('8e5f4487c4a2cff438e193004db9884fb1b48846912bd9a0e10b6c8f90e13452')
sha256sums_x86_64=('7d6015cc02043d08a6117c04ac859a6ff5e615c91528fd387b90bea3aa260405')
sha256sums_aarch64=('b6cb23deb541ffaed797efdc1038c199d309cfada2325b696d0f27f87d42dce4')

package() {
  install -Dm755 "pai-sho-v${pkgver}/pai-sho" "${pkgdir}/usr/bin/pai-sho"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
