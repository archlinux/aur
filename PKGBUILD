# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=piwik
pkgver=2.14.0
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
#source=(http://builds.piwik.org/$pkgname-$pkgver.tar.gz)
source=(http://builds.piwik.org/$pkgname-$pkgver.zip)
backup=('etc/webapps/piwik/config.ini.php')
sha512sums=('895c7110427552133f179a509b9dbf8e9ad7083604b354a036bb829f820bddd2e70f273eb6e5e2dc71b50663c797cf471a535b414b39528b946e3fe1f1ae6cad')

_piwikpath="/usr/share/webapps/"
_piwikconfigpath="/etc/webapps/piwik"

package() {
  install -d ${pkgdir}${_piwikpath}
  install -d ${pkgdir}${_piwikconfigpath}
  cp -r ${srcdir}/$pkgname ${pkgdir}${_piwikpath}
  cp ${srcdir}/$pkgname/config/global.ini.php ${pkgdir}${_piwikconfigpath}/config.ini.php
}
