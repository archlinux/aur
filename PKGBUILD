# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>
# Co-Maintainer: Nils Czernia <nils at czserver dot de>

pkgname=matomo
_pkgname=piwik
pkgver=3.4.0
pkgrel=1
pkgdesc="matomo is a real time web analytics software program, written in PHP"
arch=("any")
url="https://matomo.org/"
license=("GPL")
depends=("php" "php-gd")
replaces=("piwik")
optdepends=("mariadb: Database server"
  "python2: For log importer script"
  "php-geoip: For GeoIP php module")
install="$pkgname.install"
source=(http://builds.piwik.org/${_pkgname}-${pkgver}.tar.gz{,.asc})
backup=("etc/webapps/${pkgname}/config.ini.php")
sha512sums=("e9aeca686acadf5eb03a7a6c31e0f62df2fbeabe9eade4a2367a6433011d38933c8b8d8d8222566d135e2f31b2d55c0dbc665072021febdb2da54a94dc736005"
            "SKIP")
validpgpkeys=("814E346FA01A20DBB04B6807B5DBD5925590A237")

_matomopath="/usr/share/webapps/"
_matomoconfigpath="/etc/webapps/${pkgname}"

package() {
  install -d ${pkgdir}${_matomopath}
  install -d ${pkgdir}${_matomoconfigpath}
  cp -r ${srcdir}/${_pkgname} ${pkgdir}${_matomopath}/${pkgname}
  cp ${srcdir}/${_pkgname}/config/global.ini.php ${pkgdir}${_matomoconfigpath}/config.ini.php
}
