# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=mysql-jdbc
pkgver=5.1.40
_fullname=mysql-connector-java-${pkgver}
pkgrel=1
pkgdesc='The official JDBC driver for MySQL'
arch=('any')
url='https://dev.mysql.com/downloads/connector/j/'
license=('GPL2')
depends=('java-runtime')
install=mysql-jdbc.install
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
source=("https://cdn.mysql.com/Downloads/Connector-J/${_fullname}.tar.gz"{,.asc})
md5sums=('415a375cf8a096ef0aa775a4ae36916d'
         'SKIP')

package() {
  install -Dm644 "$srcdir/${_fullname}/${_fullname}-bin.jar" \
    "$pkgdir/usr/share/java/$pkgname/${_fullname}-bin.jar"
  ln -s ${_fullname}-bin.jar "$pkgdir/usr/share/java/$pkgname/mysql-connector-java-bin.jar"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 "$srcdir"/${_fullname}/{CHANGES,README,docs/connector-j.*} \
    "$pkgdir/usr/share/doc/$pkgname"
}
