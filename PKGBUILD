# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=fitnesse-standalone
pkgver=20161106
pkgrel=1
pkgdesc="The fully integrated standalone wiki and acceptance testing framework"
arch=('any')
url="http://www.fitnesse.org/"
license=('CPL')
depends=('java-runtime-common')
source=("http://www.fitnesse.org/${pkgname}.jar?responder=releaseDownload&release=${pkgver}"
        "fitnesse-standalone")
sha256sums=('871079c2fad0f19fdfb521f922f837c61215b3a3df94ef894c6d7a4863302c6a'
            '330273cec48faaa726768c42ed837aca0ad91776d4a004f70b703bf4d59e3658')

package() {
  mv "${pkgname}.jar?responder=releaseDownload&release=${pkgver}" "${pkgname}.jar"
  install -Dm 644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
