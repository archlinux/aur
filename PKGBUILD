# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=fitnesse-standalone
pkgver=20160515
pkgrel=1
pkgdesc="The fully integrated standalone wiki and acceptance testing framework"
arch=('any')
url="http://www.fitnesse.org/"
license=('CPL')
depends=('java-runtime-common')
source=("http://www.fitnesse.org/${pkgname}.jar?responder=releaseDownload&release=${pkgver}"
        "fitnesse-standalone")
sha256sums=('85b7f6bd207f3c08d2b613004d2c6069c6266e117a2198af4bbf38f628dde63f'
            '330273cec48faaa726768c42ed837aca0ad91776d4a004f70b703bf4d59e3658')

package() {
  mv "${pkgname}.jar?responder=releaseDownload&release=${pkgver}" "${pkgname}.jar"
  install -Dm 644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
