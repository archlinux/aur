# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Swift Geek <swiftgeek+aur@gmail.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=wee-slack
pkgver=2.9.0
pkgrel=1
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python-websocket-client')
conflicts=('wee-slack-git')
install=$pkgname.install
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=('263cf464a5188488494ce8a7fe56755c5a0379953600953719f60f0a16c0c05e2651f72b2a27ab0c85ad4dbdecfa033371af39dbe6113b75e5ee9d06687ef9b4')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the plugin script
  install -Dm644 wee_slack.py "${pkgdir}/usr/share/weechat/python/wee_slack.py"

  # Install the emoji tab completion dictionary
  install -Dm644 weemoji.json "${pkgdir}/usr/share/weechat/weemoji.json"

  # Install the plugin license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
