pkgname=wee-slack
pkgver=2.10.2
pkgrel=1
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
  '62968e95608623adfa77c1d1cb38dd29f609492c05bb65e9cdfe49461c33979cdba9345f6b190825073a4cbd391e834556870b6c35fd4c3b7ac299d61bc35071'
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
