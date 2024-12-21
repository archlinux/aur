pkgname=wee-slack
pkgdesc='A WeeChat plugin for Slack'
pkgver=2.11.0
pkgrel=1
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')

conflicts=(
  'wee-slack-git'
)

source=(
  "${pkgname}_${pkgver}.tar.gz::https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '3c30b43711fd6a18bfa25631224f6fdeb48c952b1a7ee259deb4f83f28ec63e1e9ed51deea6437fb1fa08ad7235bbdaaf877d2d87a4a9a7517fa5a2a66a71425'
)

package() {
  depends+=(
    'python-websocket-client'
    'weechat'
  )

  cd "${pkgname}-${pkgver}"
  install -Dm644 wee_slack.py "${pkgdir}/usr/share/weechat/python/wee_slack.py"
  install -Dm644 weemoji.json "${pkgdir}/usr/share/weechat/weemoji.json"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wee-slack/LICENSE"
}
