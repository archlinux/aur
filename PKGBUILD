pkgname=postgresql-jdbc
_mainver=9.4
_build=1206
pkgver=${_mainver}.${_build}
pkgrel=2
pkgdesc="The official JDBC driver for PostgreSQL. Contains JDBC 4.0 and 4.1 drivers."
arch=('any')
url="http://jdbc.postgresql.org/"
license="Custom: BSD"
depends=('java-runtime')
source=(LICENSE
        postgresql-jdbc-${pkgver}.jdbc4.jar::http://jdbc.postgresql.org/download/postgresql-${_mainver}-${_build}-jdbc4.jar
        postgresql-jdbc-${pkgver}.jdbc41.jar::http://jdbc.postgresql.org/download/postgresql-${_mainver}-${_build}-jdbc41.jar
        postgresql-jdbc-${pkgver}.jdbc42.jar::http://jdbc.postgresql.org/download/postgresql-${_mainver}-${_build}-jdbc42.jar)
md5sums=('da7e6f8b26deefe7c03b391454732a0d'
         'e10623c543e68efa015a45d368700118'
         'dcfde5d6cb368d753bc34624da1cfb33'
         'f09af18b424758866c6601846040c3ae')

noextract=(postgresql-${pkgver}.jdbc4.jar postgresql-${pkgver}.jdbc41.jar postgresql-${pkgver}.jdbc41.jar)

package() {
  install -d -m755 "${pkgdir}/usr/share/java/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 "${srcdir}/postgresql-jdbc-${pkgver}.jdbc4.jar" "${pkgdir}/usr/share/java/${pkgname}/"
  install -m644 "${srcdir}/postgresql-jdbc-${pkgver}.jdbc41.jar" "${pkgdir}/usr/share/java/${pkgname}/"

  ln -s postgresql-jdbc-${pkgver}.jdbc4.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc4.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc41.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc41.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc42.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc42.jar"

  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
