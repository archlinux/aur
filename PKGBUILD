# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=fitnesse-standalone
pkgver=20190716
pkgrel=1
pkgdesc="The fully integrated standalone wiki and acceptance testing framework"
arch=('any')
url="http://www.fitnesse.org/"
license=('CPL')
depends=('java-runtime-common')
source=("https://repo1.maven.org/maven2/org/fitnesse/fitnesse/20190716/fitnesse-${pkgver}.jar"
        "fitnesse-standalone")
sha256sums=('36d5952124f14fc7606f90496bc4cd59d6323c7cf5667b5ff6ec809d327ed0ef'
            '330273cec48faaa726768c42ed837aca0ad91776d4a004f70b703bf4d59e3658')

package() {
  mv "fitnesse-${pkgver}.jar" "${pkgname}.jar"
  install -Dm 644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
