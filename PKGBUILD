# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ninjabot-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Cryptocurrency trading bot framework and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/rodrigo-brito/ninjabot"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ninjabot_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ninjabot_Linux_arm64.tar.gz")
sha256sums_x86_64=('dc4d8c8c9b26737646c68ecea266eb738793ca39de55f921b20faf56bd28e954')
sha256sums_aarch64=('9afef18a01199cbee2448a5e6bbde0a0c74dd578e3f33ebb797f9df147b3a8ed')

package() {
  install -Dm755 "ninjabot" "${pkgdir}/usr/bin/ninjabot"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "readme.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
