# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lumon-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Mysterious and important terminal work simulator"
arch=('x86_64' 'aarch64')
url="https://github.com/terminaltrove/lumon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/terminaltrove/lumon/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/lumon_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/lumon_linux_arm64")
sha256sums=('b2a208ce180d0a6a63632e47088a075933c6585e5b53e39d8e6e33ac221cb2ae')
sha256sums_x86_64=('43a15023ec552f0128ece70e03a6ca88bc4e49b74680a72f23acf115092e538b')
sha256sums_aarch64=('2d86e342ecb8d4ab27f615f9adae627a8aaf4e4938eab6fc9bcbddadc5aa96c3')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lumon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
