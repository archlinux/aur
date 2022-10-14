# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=gatk
pkgver=4.3.0.0
pkgrel=1
pkgdesc="Variant discovery in high-throughput bioinformatics sequencing data"
arch=('any')
url=https://software.broadinstitute.org/"${pkgname}"
license=('BSD')

depends=('java-runtime>=8' 'python' 'r')
source=("https://github.com/broadinstitute/gatk/releases/download/${pkgver}/gatk-${pkgver}.zip")
sha256sums=('e2c27229b34c3e22445964adf00639a0909887bbfcc040f6910079177bc6e2dd')


package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm755 gatk $pkgdir/usr/bin/$pkgname
  install -Dm644 "gatk-package-${pkgver}-local.jar" "${pkgdir}/usr/share/java/${pkgname}/GenomeAnalysisTK.jar"
  install -Dm644 "gatk-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/gatk"
}
