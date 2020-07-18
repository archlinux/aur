# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Swift Geek <swiftgeek+aur@gmail.com>

pkgname=wee-slack
pkgver=2.6.0
pkgrel=1
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python-websocket-client')
conflicts=('wee-slack-git')
install=$pkgname.install
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=('448f9d7903fe68752b80ee4a4362bf38c6232399347ccac375e19066877dade225e38489c0969c087be2cf885acfae9612f7ad8a0fa0073db9a1cb9ffef1518c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the plugin script
  install -Dm644 wee_slack.py "${pkgdir}/usr/lib/weechat/python/wee_slack.py"

  # Install the emoji tab completion dictionary
  install -Dm644 weemoji.json "${pkgdir}/usr/lib/weechat/weemoji.json"

  # Install the plugin license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
