# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=alita_robot-bin
pkgver=2.32.0
pkgrel=1
pkgdesc="Telegram group management bot"
arch=('x86_64' 'aarch64')
url="https://github.com/Divkix/Alita_Robot"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/alita_robot_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/alita_robot_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5ea361b6bb8326e57a774b4e2679792acd2d56e0640ef23e28d4bb50c93130e8')
sha256sums_aarch64=('fd250644cd5a637fd097d35ea7607563af4561dc09e17a872e4c52bd63bcf486')

package() {
  install -Dm755 "alita_robot" "${pkgdir}/usr/bin/alita_robot"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
