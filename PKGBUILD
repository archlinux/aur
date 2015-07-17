# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=piwik
pkgver=2.14.1
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
sha512sums=('f49e3ca3fd43a1f367848d2153f5a6381ef3730cd0c8f8a3e16a774a9f6c1cde07d20e67e2da4f2780b973b24d2fd6d626e16812f25e619f2627c0aeba6cf397')

_piwikpath="/usr/share/webapps/"
_piwikconfigpath="/etc/webapps/piwik"

package() {
  install -d ${pkgdir}${_piwikpath}
  install -d ${pkgdir}${_piwikconfigpath}
  cp -r ${srcdir}/$pkgname ${pkgdir}${_piwikpath}
  cp ${srcdir}/$pkgname/config/global.ini.php ${pkgdir}${_piwikconfigpath}/config.ini.php
}
