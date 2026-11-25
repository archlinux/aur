# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gravity-bin
pkgver=0.34.0
pkgrel=1
pkgdesc="Replicated DNS and DHCP server with ad blocking, powered by etcd"
arch=('x86_64' 'aarch64')
url="https://github.com/BeryJu/gravity"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/BeryJu/gravity/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gravity-cli_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/gravity-cli_linux_arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('e891d60335fd3ad0285c3ce146a37c3107cf3a4a684e662b3b551ac39c71634a')
sha256sums_aarch64=('1cfaa66e44ed2dac6a9c11f8c9e5237171fe7c46aa5aa45f6773abed65f3f41d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gravity-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
