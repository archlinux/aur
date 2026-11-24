# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cli-wechat-bridge
_npmname=cli-wechat-bridge
pkgver=1.5.0
pkgrel=1
pkgdesc="Bridge WeChat and Telegram to local coding agents"
arch=('any')
url="https://github.com/unlinearity/cli-wechat-bridge"
license=('AGPL-3.0-or-later')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/cli-wechat-bridge-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('1c275aa8bf00781a76a9da7ef41502d450f305e1eee912082dcb12d3e5141cc1')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
