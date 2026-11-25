# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=picobot-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight self-hosted AI bot in a single binary"
arch=('x86_64' 'aarch64')
url="https://github.com/louisho5/picobot"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/louisho5/picobot/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/picobot_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/picobot_linux_arm64")
sha256sums=('885b410c7c0fe0b4071ff10d75a40a8c28b94d06a2223dc294496a3e6d84b1ec')
sha256sums_x86_64=('d2c0378b99073f4391432ea75380ff66a0715cb2c871ae451775216c312f6938')
sha256sums_aarch64=('3338d55ac7b592c61c2b2d53ca687d7ae260eff07787f4231cba68dd9e5e3683')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/picobot"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
