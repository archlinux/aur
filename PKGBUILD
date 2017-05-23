# Maintainer: William Hahn <bill@hahn3.com>

pkgname=nextcloud-app-rainloop
pkgver=4.28.1
pkgrel=1
pkgdesc="RainLoop Webmail for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/rainloop"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.zip::https://github.com/pierre-alain-b/rainloop-nextcloud/releases/download/$pkgver/rainloop-$pkgver.tar.gz")
sha256sums=('805ae6292f04f786fa4c39f385f1880b94b1ed5b7de88f38079bdd66246df365')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/rainloop ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
  chown -R http:http ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
}
