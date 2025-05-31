# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=java-commons-cli
pkgver=1.9.0
pkgrel=1
pkgdesc='Java API for parsing command line options passed to programs'
arch=('i686' 'x86_64')
url='http://commons.apache.org/cli/'
license=('Apache-2.0')
depends=('java-runtime')
source=("https://dlcdn.apache.org/commons/cli/binaries/commons-cli-${pkgver}-bin.tar.gz")
sha256sums=('133f8cb9bf0bba0de7f7158f3d0dcc2bd7c89bc54c386ba24bb89fdf098f2173')

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
