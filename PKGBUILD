# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=slack-bot-bin
pkgver=2.3.19
pkgrel=1
pkgdesc="Slack bot for developers that runs Jenkins jobs and watches Jira and pull requests"
arch=('x86_64')
url="https://github.com/innogames/slack-bot"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/innogames/slack-bot/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/slack-bot-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('8653104120ff8df5d25107b7de729ec64877691c43bfc788dcae1066742b4a11')
sha256sums_x86_64=('aabadcb37f7bf992f69e8d1b2d0574cebd2ae86715fed4162b73b1b3ccc3f624')

package() {
  install -Dm755 "slack-bot" "${pkgdir}/usr/bin/slack-bot"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
