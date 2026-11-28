# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ligolo-mp-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Client for ligolo-mp, a multiplayer network pivoting tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ttpreport/ligolo-mp"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ttpreport/ligolo-mp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ligolo-mp_client_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ligolo-mp_client_linux_arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('591d0d93e4ed417fc5fd44a1b017055c52eb8fbab8355f5c8f986ab2e1def84d')
sha256sums_aarch64=('d65d6c62b843eada5290a660ed187dcd7430390dac0a96d32137c037bf827644')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ligolo-mp_client"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
