# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=gatk
pkgver=4.4.0.0
pkgrel=1
pkgdesc="Variant discovery in high-throughput bioinformatics sequencing data"
arch=('any')
url=https://software.broadinstitute.org/"${pkgname}"
license=('BSD')

depends=('java-runtime>=8' 'python' 'r')
source=("https://github.com/broadinstitute/gatk/releases/download/${pkgver}/gatk-${pkgver}.zip")
sha256sums=('444600f7b38b46ad0b3606b7d40ce921e0ff1910a50165872f1c73c7c4a1a390')


package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm755 gatk $pkgdir/usr/bin/$pkgname
  install -Dm644 "gatk-package-${pkgver}-local.jar" "${pkgdir}/usr/share/java/${pkgname}/GenomeAnalysisTK.jar"
  install -Dm644 "gatk-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/gatk"
}
