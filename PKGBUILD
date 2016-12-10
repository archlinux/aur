#Mainteiner: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=postgresql-jdbc
_mainver=9.4
_build=1212
pkgver=${_mainver}.${_build}
pkgrel=1
pkgdesc="The official JDBC driver for PostgreSQL. Contains JDBC 4.0, 4.1 & 4.2 drivers."
arch=('any')
url="http://jdbc.postgresql.org/"
license=("Custom: BSD")
depends=('java-runtime')
source=(LICENSE
        postgresql-jdbc-${pkgver}.jdbc4.jar::http://jdbc.postgresql.org/download/postgresql-${_mainver}.${_build}.jre6.jar
        postgresql-jdbc-${pkgver}.jdbc41.jar::http://jdbc.postgresql.org/download/postgresql-${_mainver}.${_build}.jre7.jar
        postgresql-jdbc-${pkgver}.jdbc42.jar::http://jdbc.postgresql.org/download/postgresql-${_mainver}.${_build}.jar)
md5sums=('da7e6f8b26deefe7c03b391454732a0d'
         '89d12cab16d56861b1eb21b04ebeccee'
         '8681ad73ea0de09c3d8a6dfb0470412f'
         '7539a1c9b0e7c5af36e498f79d6ef3b4')

noextract=(postgresql-jdbc-${pkgver}.jdbc4.jar
           postgresql-jdbc-${pkgver}.jdbc41.jar
           postgresql-jdbc-${pkgver}.jdbc42.jar)

package() {
  install -d -m755 "${pkgdir}/usr/share/java/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 "${srcdir}/postgresql-jdbc-${pkgver}.jdbc4.jar" "${pkgdir}/usr/share/java/${pkgname}/"
  install -m644 "${srcdir}/postgresql-jdbc-${pkgver}.jdbc41.jar" "${pkgdir}/usr/share/java/${pkgname}/"

  ln -s postgresql-jdbc-${pkgver}.jdbc4.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc4.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc41.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc41.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc42.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc42.jar"

  ln -s postgresql-jdbc-${pkgver}.jdbc4.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-${_mainver}.${_build}.jre6.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc41.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-${_mainver}.${_build}.jre7.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc42.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-${_mainver}.${_build}.jar"
  
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
