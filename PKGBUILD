pkgname='openmeetings-mysql-connector-java'
pkgver='8.0.19'
pkgrel='1'
pkgdesc='Java library to connect to MySQL for openmeetings'
arch=('any')
url='http://www.mysql.com/downloads/connector/j/'
license=(GPL,custom)
depends=( 'openmeetings' 'java-environment' )

# Nothing to strip in a Java package, wastes time!
options=('!strip')

install="${pkgname}.install"

source=("http://dev.mysql.com/Downloads/Connector-J/mysql-connector-java-${pkgver}.tar.gz")

sha256sums=('ef7810ff8e56cc62b747dcf0a2c335b7bcd6f642be86314b9b6bf182870dd0f2')

package() {
  # Install mysql-connector-java
  install -dm755 ${pkgdir}/opt/openmeetings/webapps/openmeetings/WEB-INF/lib
  cp -p -r ${srcdir}/mysql-connector-java-${pkgver}/mysql-connector-java-${pkgver}.jar \
           ${pkgdir}/opt/openmeetings/webapps/openmeetings/WEB-INF/lib/mysql-connector-java-${pkgver}.jar

}
