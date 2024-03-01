pkgname=wee-slack
pkgver=2.9.0
pkgrel=2
pkgdesc='A WeeChat plugin for Slack'
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
  '263cf464a5188488494ce8a7fe56755c5a0379953600953719f60f0a16c0c05e2651f72b2a27ab0c85ad4dbdecfa033371af39dbe6113b75e5ee9d06687ef9b4'
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
