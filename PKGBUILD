# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=snpeff
pkgver=5.1
pkgrel=1
pkgdesc="Genetic variant annotation and effect prediction toolbox. https://doi.org/10.4161/fly.19695"
arch=('any')
url="https://pcingola.github.io/SnpEff/"
provides=(""${pkgname%-pkgver}"")
license=('MIT')
depends=('java-runtime>=12''python''perl''bash')
source=(
  snpEff.sh
  SnpSift.sh
  https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip
)
sha256sums=('e0ba5679a90efdb39cd9398b1db708444fd8e5321182cedf72696b3ae1e2e2b9'
            '4bd0163c6b8864ed6ea3f20d215b0bf371e10eaa4156ffcf8429d6f71ded93e3'
            '919e0595c08e86d1dd82279723c83cb872070244ee4ce0cb3167bde2b272893b')

package() {
  cd "${srcdir}/"
  install -Dm644 snpEff/snpEff.jar  "${pkgdir}"/usr/share/java/snpEff/snpEff.jar
  for d in snpEff/ ; do
    cp -R "$d" "${pkgdir}"/usr/share/java/
  done
  install -Dm644 snpEff/snpEff.jar  "${pkgdir}"/usr/share/java/snpEff/snpEff.jar
  install -Dm644 snpEff/SnpSift.jar "${pkgdir}"/usr/share/java/snpEff/SnpSift.jar
  install -Dm644 snpEff/snpEff.config "${pkgdir}"/usr/share/java/snpEff/snpEff.config
  install -Dm644 snpEff/LICENSE.md "${pkgdir}"/usr/share/licenses/snpEff/LICENSE.md
  install -Dm755 snpEff.sh "${pkgdir}"/usr/bin/snpEff
  install -Dm755 SnpSift.sh "${pkgdir}"/usr/bin/SnpSift
}
