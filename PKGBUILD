# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=routeconverter
pkgver=2.24
pkgrel=1
pkgdesc="A free tool to edit and convert routes, tracks and waypoints."
arch=('i686' 'x86_64')
url="http://www.routeconverter.de/en"
license=('GPL')
depends=('java-environment>=6' 'java-openjfx')
optdepends=('gpsbabel: for some additional format support')
changelog=ChangeLog
source=(routeconverter
        routeconverter-cli
        http://static.routeconverter.com/download/previous-releases/${pkgver}/RouteConverterCmdLine.jar
        http://static.routeconverter.com/download/RouteConverterLinux.jar)

noextract=(RouteConverterCmdLine.jar
           RouteConverterLinux.jar
           RouteConverterLinux64.jar)

package()
{
  cd "$srcdir"

  install -m 755 -o root -g root -d ${pkgdir}/usr/bin
  install -m 755 -o root -g root -d ${pkgdir}/usr/lib/${pkgname}
  install -m 755 -o root -g root \
			${srcdir}/routeconverter \
			${srcdir}/routeconverter-cli \
			${pkgdir}/usr/bin/
  install -m 644 -o root -g root \
			${srcdir}/RouteConverterCmdLine.jar \
			${pkgdir}/usr/lib/${pkgname}/
  install -m 644 -o root -g root \
			${srcdir}/RouteConverterLinux.jar \
			${pkgdir}/usr/lib/${pkgname}/ || true

}

md5sums=('e4cdc9db82a9f8c550afb44f851d897f'
         'fdf570309917df1c1536b7e3c7740b33'
         '60cbeb53ebed1b867d6d0eec58de907f'
         '9103d26c1259529a07f00dd0c7734064')
