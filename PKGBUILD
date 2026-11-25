# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=saveany-bot-bin
pkgver=0.63.0
pkgrel=1
pkgdesc="Save Any Telegram File to Anywhere (Alist, Disk, Webdav, S3, Rclone...) . Support restrict saving content and files beyond telegram"
arch=('x86_64' 'aarch64')
url="https://github.com/krau/SaveAny-Bot"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/saveany-bot-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/saveany-bot-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('f3d5dcf69c9eefada84c4fe569bcc3799360386d8e6f2d572a889552c4829359')
sha256sums_aarch64=('7b58424253ba65886b995e499676961a48178c7b0ec828f19509635d1955fd20')

package() {
  install -Dm755 "saveany-bot" "${pkgdir}/usr/bin/saveany-bot"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
