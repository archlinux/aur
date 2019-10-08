# Maintainer: William Hahn <bill@hahn3.com>

pkgname=nextcloud-app-rainloop
pkgver=6.0.4
pkgrel=1
pkgdesc="RainLoop Webmail for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/rainloop"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pierre-alain-b/rainloop-nextcloud/releases/download/$pkgver/rainloop.tar.gz")
sha256sums=('952c20b00afe623b799b50a133254c727d27daf5d803415b66ba473ddb40152e')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/rainloop ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
  chown -R http:http ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
}
