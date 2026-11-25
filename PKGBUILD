# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nakama-bin
pkgver=3.42.0
pkgrel=1
pkgdesc="Scalable open-source game backend server: multiplayer, matchmaking, leaderboards, chat, and social features for games"
arch=('x86_64' 'aarch64')
url="https://github.com/heroiclabs/nakama"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nakama-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nakama-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('1c074baeb0a57bee0a89369b8acaf0cca32ae010924817c9a3dbc05a664a59c8')
sha256sums_aarch64=('5718a66fc2e21393c0df689629bd2374067c002e89161f76defea5de036cb8be')

package() {
  install -Dm755 "nakama" "${pkgdir}/usr/bin/nakama"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
