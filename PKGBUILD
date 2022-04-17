# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=gatk
pkgver=4.2.6.1
pkgrel=1
epoch=2
pkgdesc="Variant discovery in high-throughput bioinformatics sequencing data"
arch=('any')
url=https://software.broadinstitute.org/"${pkgname}"
license=('BSD')

depends=('java-runtime>=8' 'python' 'r')
source=("https://github.com/broadinstitute/gatk/releases/download/4.2.6.1/gatk-${pkgver}.zip")
sha256sums=('1125cfc862301d437310506c8774d36c3a90d00d52c7b5d6b59dac7241203628')


package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm755 gatk $pkgdir/usr/bin/$pkgname
  install -Dm644 "gatk-package-${pkgver}-local.jar" "${pkgdir}/usr/share/java/${pkgname}/GenomeAnalysisTK.jar"
  install -Dm644 "gatk-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/gatk"
}
