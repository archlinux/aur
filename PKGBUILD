# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=java-commons-cli
pkgver=1.4
pkgrel=1
pkgdesc='Java API for parsing command line options passed to programs'
arch=('i686' 'x86_64')
url='http://commons.apache.org/cli/'
license=('APACHE')
depends=('java-runtime')
source=("http://artfiles.org/apache.org//commons/cli/binaries/commons-cli-${pkgver}-bin.tar.gz")
sha256sums=('e9f134cd94c13a77b87648871140104338a3b90320658c1860b73f4d5732a793')

package() {
   cd "${srcdir}"

   JAVA_DIR="${pkgdir}/usr/share/java/${pkgname}"

   install -d "${JAVA_DIR}"
   install -m644 ${srcdir}/commons-cli-${pkgver}/commons-cli-${pkgver}.jar "${JAVA_DIR}"
   install -m644 ${srcdir}/commons-cli-${pkgver}/commons-cli-${pkgver}-javadoc.jar "${JAVA_DIR}"
   #install -m644 ${srcdir}/commons-cli-${pkgver}/commons-cli-${pkgver}-sources.jar "${JAVA_DIR}"

   ln -sr "${JAVA_DIR}"/commons-cli-${pkgver}.jar "${JAVA_DIR}"/commons-cli.jar
   ln -sr "${JAVA_DIR}"/commons-cli-${pkgver}-javadoc.jar "${JAVA_DIR}"/commons-cli-javadoc.jar
   #ln -sr "${JAVA_DIR}"/commons-cli-${pkgver}-sources.jar "${JAVA_DIR}"/commons-cli-sources.jar
}
