# Maintainer: Michael Bryant <shadow53 at shadow53 dot com>
pkgbase="scalatest"
pkgname=("scalatest" "scalatest-docs" "scalatest-sources")
pkgver=2.2.6
pkgrel=1
pkgdesc="Testing framework for Scala"
arch=("any")
url="http://scalatest.org"
license=('Apache')
depends=("scala>=2.10.0")
provides=("scalatest" "scalatest-docs" "scalatest-sources")
options=()
install=
changelog=
source=("https://oss.sonatype.org/content/groups/public/org/${pkgbase}/${pkgbase}_2.11/${pkgver}/${pkgbase}_2.11-${pkgver}.jar"
        "https://oss.sonatype.org/content/groups/public/org/${pkgbase}/${pkgbase}_2.11/${pkgver}/${pkgbase}_2.11-${pkgver}-javadoc.jar"
        "https://oss.sonatype.org/content/groups/public/org/${pkgbase}/${pkgbase}_2.11/${pkgver}/${pkgbase}_2.11-${pkgver}-sources.jar")
noextract=()
md5sums=('5f104ce268f7f823750ddaad93533296'
         '5e5549fb2ad82c3ba39ecb857c9a3ad7'
         '3f4eecc56cc77f39ac74047de647807f')

package_scalatest() {
  optdepends=("scalatest-docs: ScalaTest Documentation"
            "scalatest-sources: ScalaTest Sources")

  mkdir -p ${pkgdir}/usr/share/${pkgbase}/lib
  
  mv -t ${pkgdir}/usr/share/${pkgbase}/lib/ ${pkgbase}_2.11-${pkgver}.jar
}

package_scalatest-docs() {
  mkdir -p ${pkgdir}/usr/share/doc/${pkgbase}/api/jars
  
  mv -t ${pkgdir}/usr/share/doc/${pkgbase}/api/jars ${pkgbase}_2.11-${pkgver}-javadoc.jar
}

package_scalatest-sources(){
  mkdir -p ${pkgdir}/usr/share/${pkgbase}/src
  
  mv -t ${pkgdir}/usr/share/${pkgbase}/src ${pkgbase}_2.11-${pkgver}-sources.jar
}
