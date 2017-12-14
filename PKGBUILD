# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=snpeff
pkgver=4_3t
pkgrel=1
pkgdesc="Genetic variant annotation and effect prediction toolbox"
arch=('any')
url="http://snpeff.sourceforge.net/"
license=('LGPLv3')
depends=('java-runtime>=8')
provides=('snpeff')
conflicts=('snpeff')
source=(
  "http://sourceforge.net/projects/${pkgname}/files/snpEff_v${pkgver}_core.zip"
  "snpeff"
  "snpsift"
)
md5sums=(
  '1fa84a703580a423e27f1e14a945901c'
  '9f0415d2e713f0acffec4d88253e769d'
  '3a2f8a17dfffca77375806d2dee12b0c'
)

package() {
  cd "${srcdir}/"

  install -Dm644 "snpEff/snpEff.jar"  "${pkgdir}/usr/share/java/snpEff_v${pkgver}/snpEff.jar"
  install -Dm644 "snpEff/SnpSift.jar" "${pkgdir}/usr/share/java/snpEff_v${pkgver}/SnpSift.jar"
  install -Dm644 "snpEff/snpEff.config" "${pkgdir}/usr/share/java/snpEff_v${pkgver}/snpEff.config"

  install -Dm755 "snpeff" "${pkgdir}/usr/bin/snpEff"
  install -Dm755 "snpsift" "${pkgdir}/usr/bin/SnpSift"
}
