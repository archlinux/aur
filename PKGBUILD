# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=piwik
pkgver=3.0.2
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
sha512sums=('2b2ba6519067a872652f8f53bdfb98b91d0498cabb185d78d36b54c2bad5a297fe40306be6323af0d6500a20f45e9490902b74f590e5f104dd5380c6866ed5d9'
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
