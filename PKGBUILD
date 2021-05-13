# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Swift Geek <swiftgeek+aur@gmail.com>

pkgname=wee-slack
pkgver=2.8.0
pkgrel=1
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python-websocket-client')
conflicts=('wee-slack-git')
install=$pkgname.install
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=('96e778e51c87ca0f51ea60a2b09c3ef3fc8abde563e203b7d1af576ec0bd508e5dc10f93a36172ccbd4abc539a0591a1f71aaeb565105127ee64a832100985ae')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the plugin script
  install -Dm644 wee_slack.py "${pkgdir}/usr/share/weechat/python/wee_slack.py"

  # Install the emoji tab completion dictionary
  install -Dm644 weemoji.json "${pkgdir}/usr/share/weechat/weemoji.json"

  # Install the plugin license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
