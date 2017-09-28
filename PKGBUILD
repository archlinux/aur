# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=gatk
_pkgver=3.8-0
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='Genome Analysis Toolkit - Variant Discovery in High-Throughput Sequencing Data'
arch=('any')
url="https://software.broadinstitute.org/gatk/"
license=('custom')
depends=('bash' 'java-runtime>=8')
source=("$pkgname-$pkgver.tar.bz2::https://software.broadinstitute.org/gatk/download/auth?package=GATK"
        'gatk-license.txt'
        'gatk.sh')
md5sums=('0581308d2a25f10d11d3dfd0d6e4d28e'
         'ed8d005306adf1d18c477ee5b19c4b9e'
         '8a0bd3c67fc4670b36d28bc383dc883b')

package() {
  install -Dm755 $srcdir/gatk.sh $pkgdir/usr/bin/gatk

  install -Dm644 \
    $srcdir/GenomeAnalysisTK-$_pkgver-*/GenomeAnalysisTK.jar \
    $pkgdir/usr/share/java/gatk/GenomeAnalysisTK.jar

  install -Dm644 $srcdir/gatk-license.txt $pkgdir/usr/share/licenses/gatk/LICENSE
}
