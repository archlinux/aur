# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: willemw

pkgname=routeconverter
pkgver=2.24
pkgrel=2
pkgdesc="A free tool to edit and convert routes, tracks and waypoints"
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
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m755 "${srcdir}/routeconverter" \
		"${srcdir}/routeconverter-cli" \
		"${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/RouteConverterCmdLine.jar" \
		"${pkgdir}/usr/lib/${pkgname}/"
  install -m644 "${srcdir}/RouteConverterLinux.jar" \
		"${pkgdir}/usr/lib/${pkgname}/"
}

md5sums=('e4cdc9db82a9f8c550afb44f851d897f'
         'fdf570309917df1c1536b7e3c7740b33'
         '60cbeb53ebed1b867d6d0eec58de907f'
         '9103d26c1259529a07f00dd0c7734064')
