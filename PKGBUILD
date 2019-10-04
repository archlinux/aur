# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=fitnesse-standalone
pkgver=20180127
pkgrel=2
pkgdesc="The fully integrated standalone wiki and acceptance testing framework"
arch=('any')
url="http://www.fitnesse.org/"
license=('CPL')
depends=('java-runtime-common')
source=("https://repo1.maven.org/maven2/org/fitnesse/fitnesse/${pkgver}/fitnesse-${pkgver}.jar"
        "fitnesse-standalone")
sha256sums=('9883aaee3a27ddfc56a696e8f8299affc27405859e630a83c454a96314daf725'
            '330273cec48faaa726768c42ed837aca0ad91776d4a004f70b703bf4d59e3658')

package() {
  mv "fitnesse-${pkgver}.jar" "${pkgname}.jar"
  install -Dm 644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
