pkgname=wee-slack-git
pkgver=2.10.2.r368.gedaad8b
pkgrel=1
pkgdesc='A WeeChat plugin for Slack'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')

makedepends=(
  'git'
)

conflicts=(
  'wee-slack'
)

source=(
  'git+https://github.com/wee-slack/wee-slack'
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd wee-slack
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

package() {
  depends+=(
    'python-websocket-client'
    'weechat'
  )

  cd wee-slack
  install -Dm644 wee_slack.py "${pkgdir}/usr/share/weechat/python/wee_slack.py"
  install -Dm644 weemoji.json "${pkgdir}/usr/share/weechat/weemoji.json"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wee-slack/LICENSE"
}
