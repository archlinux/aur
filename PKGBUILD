# Maintainer: Gleb Pavliuk <pglebr@gmail.com>
# Contributor: Mustafa Siam Ur Rafique <outlook.com: siam11651>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=postgresql-jdbc
pkgver=42.7.11
pkgrel=1
pkgdesc='The official JDBC driver for PostgreSQL. Contains JDBC 4.2 drivers.'
arch=('any')
url='https://jdbc.postgresql.org/'
license=('BSD-2-Clause')
depends=('java-runtime-headless')
source=(LICENSE
        https://repo1.maven.org/maven2/org/postgresql/postgresql/${pkgver}/postgresql-${pkgver}.jar{,.asc})
sha1sums=('98ca35c08254ed04b2f40e01aa5b1d29c2920665'
          '4c21cdd1b3938f400703716d37c4e8ca4d332808'
          'SKIP')

noextract=(postgresql-${pkgver}.jar)

validpgpkeys=('86C0144909739E0EE3D1B545305F296EAC47556B')

package() {
  install -d -m755 "${pkgdir}/usr/share/java/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 "${srcdir}/postgresql-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/"

  ln -s postgresql-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc42.jar"
  ln -s postgresql-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql-jdbc.jar"
  ln -s postgresql-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/postgresql.jar"

  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
