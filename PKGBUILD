# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=snpeff
pkgver=4_3t
pkgrel=2
pkgdesc="Genetic variant annotation and effect prediction toolbox"
arch=('any')
url="http://snpeff.sourceforge.net/"
license=('(L)GPL3')
depends=('java-runtime>=8')
source=(
  snpEff.sh
  SnpSift.sh
  http://sourceforge.net/projects/"${pkgname}"/files/snpEff_v"${pkgver}"_core.zip
)
sha256sums=(
  'e0ba5679a90efdb39cd9398b1db708444fd8e5321182cedf72696b3ae1e2e2b9'
  '4bd0163c6b8864ed6ea3f20d215b0bf371e10eaa4156ffcf8429d6f71ded93e3'
  'd55a7389a78312947c1e7dadf5e6897b42d3c6e942e7c1b8ec68bb35d2ae2244'
)

package() {
  cd "${srcdir}/"

  install -Dm644 snpEff/snpEff.jar  "${pkgdir}"/usr/share/java/snpEff/snpEff.jar
  install -Dm644 snpEff/SnpSift.jar "${pkgdir}"/usr/share/java/snpEff/SnpSift.jar
  install -Dm644 snpEff/snpEff.config "${pkgdir}"/usr/share/java/snpEff/snpEff.config
  install -Dm755 snpEff.sh "${pkgdir}"/usr/bin/snpEff
  install -Dm755 SnpSift.sh "${pkgdir}"/usr/bin/SnpSift
}
