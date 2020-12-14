#Mainteiner: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=postgresql-jdbc
pkgver=42.2.18
pkgrel=1
pkgdesc="The official JDBC driver for PostgreSQL. Contains JDBC 4.0, 4.1 & 4.2 drivers."
arch=('any')
url="http://jdbc.postgresql.org/"
license=("Custom: BSD")
depends=('java-runtime')
source=(LICENSE
        postgresql-jdbc-${pkgver}.jdbc4.jar::https://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/${pkgver}.jre6/postgresql-${pkgver}.jre6.jar
        postgresql-jdbc-${pkgver}.jdbc41.jar::https://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/${pkgver}.jre7/postgresql-${pkgver}.jre7.jar
        postgresql-jdbc-${pkgver}.jdbc42.jar::https://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/${pkgver}/postgresql-${pkgver}.jar)
md5sums=('da7e6f8b26deefe7c03b391454732a0d'
         'af08226777cdb66e6c5ade2482c8452a'
         'dff2757f4465d3e4e15da9671b8c2403'
         'd6895bb05ac7b9c85c4e89f3880127e3')

noextract=(postgresql-jdbc-${pkgver}.jdbc4.jar
           postgresql-jdbc-${pkgver}.jdbc41.jar
           postgresql-jdbc-${pkgver}.jdbc42.jar)

package() {
  install -d -m755 "${pkgdir}/usr/share/java/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 "${srcdir}/postgresql-jdbc-${pkgver}.jdbc4.jar" "${pkgdir}/usr/share/java/${pkgname}/"
  install -m644 "${srcdir}/postgresql-jdbc-${pkgver}.jdbc41.jar" "${pkgdir}/usr/share/java/${pkgname}/"
  install -m644 "${srcdir}/postgresql-jdbc-${pkgver}.jdbc42.jar" "${pkgdir}/usr/share/java/${pkgname}/"

  ln -s postgresql-jdbc-${pkgver}.jdbc4.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc4.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc41.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc41.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc42.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc42.jar"

  ln -s postgresql-jdbc-${pkgver}.jdbc4.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-${pkgver}.jre6.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc41.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-${pkgver}.jre7.jar"
  ln -s postgresql-jdbc-${pkgver}.jdbc42.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-${pkgver}.jar"
  
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
