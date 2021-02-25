# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Swift Geek <swiftgeek+aur@gmail.com>

pkgname=wee-slack
pkgver=2.7.0
pkgrel=1
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python-websocket-client')
conflicts=('wee-slack-git')
install=$pkgname.install
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=('82d4801aea48c6d52b1610078f6f99d1e193942a0368953f15de3942143a3aa0cfdf43d580eb8c51d76046971d91e3f837de9b544cab5370647dcd6e5e5a4337')

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
