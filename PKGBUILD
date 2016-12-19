# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=piwik
pkgver=3.0.0
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
sha512sums=('1b90e9c1a22d77e69678b95046bc41e34326a5e8907f5dc9e2c3f3ccaa763e4a9fcb770b250268385f3f9fc266958c842b4e924523fdec682acd42c886956999'
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
