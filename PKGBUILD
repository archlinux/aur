# Maintainer: William Hahn <bill@hahn3.com>

pkgname=nextcloud-app-rainloop
pkgver=7.0.1
pkgrel=1
pkgdesc="RainLoop Webmail for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/rainloop"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pierre-alain-b/rainloop-nextcloud/releases/download/$pkgver/rainloop.tar.gz")
sha256sums=('f6294cc0ee2fd852c9fb2693a11006997ec416a81e099d9b90270a83f94cf9ba')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/rainloop ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
  chown -R http:http ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
}
