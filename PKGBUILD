#Mainteiner: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=postgresql-jdbc
pkgver=42.7.5
pkgrel=1
pkgdesc="The official JDBC driver for PostgreSQL. Contains JDBC 4.2 drivers."
arch=('any')
url="http://jdbc.postgresql.org/"
license=("Custom: BSD")
depends=('java-runtime-headless')
source=(LICENSE
        https://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/${pkgver}/postgresql-${pkgver}.jar)
md5sums=('da7e6f8b26deefe7c03b391454732a0d'
         '5cd7ba0dfa9ec82c4812b5bf387de185')

noextract=(postgresql-${pkgver}.jar)

package() {
  install -d -m755 "${pkgdir}/usr/share/java/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 "${srcdir}/postgresql-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/"

  ln -s postgresql-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc42.jar"
  ln -s postgresql-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc.jar"
  ln -s postgresql-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql.jar"
  
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
