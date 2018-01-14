# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>
# Co-Maintainer: Nils Czernia <nils at czserver dot de>

pkgname=piwik
pkgver=3.3.0
pkgrel=1
pkgdesc="Piwik is a real time web analytics software program, written in PHP"
arch=("any")
url="http://www.piwik.org"
license=("GPL")
depends=("php" "php-gd")
optdepends=("mariadb: Database server"
  "python2: For log importer script"
  "php-geoip: For GeoIP php module")
install=$pkgname.install
source=(http://builds.piwik.org/$pkgname-$pkgver.tar.gz{,.asc})
backup=("etc/webapps/piwik/config.ini.php")
sha512sums=("746fb35d7fc365180645151703c497dde3b367613e462404dea8ba0dfd83f217bc9211f9e6f723cf9bb643707b07c729a5987991e19b8cee5f6cf0588c44a118"
            "SKIP")
validpgpkeys=("814E346FA01A20DBB04B6807B5DBD5925590A237")

_piwikpath="/usr/share/webapps/"
_piwikconfigpath="/etc/webapps/piwik"

package() {
  install -d ${pkgdir}${_piwikpath}
  install -d ${pkgdir}${_piwikconfigpath}
  cp -r ${srcdir}/$pkgname ${pkgdir}${_piwikpath}
  cp ${srcdir}/$pkgname/config/global.ini.php ${pkgdir}${_piwikconfigpath}/config.ini.php
}
