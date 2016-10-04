# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=piwik
pkgver=2.16.4
pkgrel=1
pkgdesc="Piwik is a real time web analytics software program, written in PHP"
arch=('any')
url="http://www.piwik.org"
license=('GPL')
depends=('php' 'php-gd')
optdepends=('mariadb: Database server'
  'python2: For log importer script'
  'php-geoip: For GeoIP php module')
install=$pkgname.install
source=(http://builds.piwik.org/$pkgname-$pkgver.tar.gz{,.asc})
backup=('etc/webapps/piwik/config.ini.php')
sha512sums=('e88d7d9c9d93201bc38a34ce732de634208fca1a3161ba08ba202532f4a71c8c755749286e309e1e37466892f7cf41deb09155b1bbc4189b82714ee63027ec97'
            'SKIP')
validpgpkeys=('814E346FA01A20DBB04B6807B5DBD5925590A237')

_piwikpath="/usr/share/webapps/"
_piwikconfigpath="/etc/webapps/piwik"

package() {
  install -d ${pkgdir}${_piwikpath}
  install -d ${pkgdir}${_piwikconfigpath}
  cp -r ${srcdir}/$pkgname ${pkgdir}${_piwikpath}
  cp ${srcdir}/$pkgname/config/global.ini.php ${pkgdir}${_piwikconfigpath}/config.ini.php
}
