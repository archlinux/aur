# Maintainer: Alexander Sobolevkiy <smak.nsk@gmail.com>
# Contributor: Erik Dubbelboer <erik@dubbelboer.com>

pkgname=phpredisadmin
pkgver=1.11.0
pkgrel=1
pkgdesc="phpRedisAdmin is a simple web interface to manage Redis databases"
arch=('any')
url="https://github.com/erikdubbelboer/phpRedisAdmin"
license=('GPL')
source=("https://github.com/erikdubbelboer/phpRedisAdmin/archive/v${pkgver}.tar.gz"
        "https://github.com/nrk/predis/archive/v1.1.1.zip")
md5sums=('394e8a9924a8ecfee2335aa7efc2b188'
         '8755fd28c226c5ac2b73c09b0dce70de')

package() {
  _instdir="$pkgdir"/usr/share/webapps/phpRedisAdmin
  mkdir -p "$_instdir" "$pkgdir"/etc/webapps/phpredisadmin
  cd "$_instdir"

  cp -ra "$srcdir"/phpRedisAdmin-$pkgver/* .
  cp -ra "$srcdir"/predis-1.1.1 ./vendor

  ln -s /etc/webapps/phpredisadmin/config.inc.php "$_instdir"/includes/config.inc.php
  cp "$_instdir"/includes/config.sample.inc.php "$pkgdir"/etc/webapps/phpredisadmin/config.inc.php
}
