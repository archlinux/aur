# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=piwik
pkgver=2.13.1
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
sha512sums=('cfddacfb20d94a696e73bad37d40461bfef411ea67843e9377733ceff49641cf8780ed9ade8a9f14d0f50602c66897d5b88fe2aca78872c475a120d1af414212')

_piwikpath="/usr/share/webapps/"
_piwikconfigpath="/etc/webapps/piwik"

package() {
  install -d ${pkgdir}${_piwikpath}
  install -d ${pkgdir}${_piwikconfigpath}
  cp -r ${srcdir}/$pkgname ${pkgdir}${_piwikpath}
  cp ${srcdir}/$pkgname/config/global.ini.php ${pkgdir}${_piwikconfigpath}/config.ini.php
}
