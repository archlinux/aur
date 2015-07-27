# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>

pkgname=piwik
pkgver=2.14.2
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
sha512sums=('706ba2632816b1cc038118abdb3de85012da7d785f714d77d014d791c6bbe0257860d42c9e50c8bb47eb1ec3bab4b514a09faad1de4224c8f9256e4e5f04c6e6'
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
