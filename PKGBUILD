# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=bcl2fastq-rpm
pkgver=2.17.1.14
pkgrel=2
pkgdesc="Demultiplexes Illumina sequencer BCL files into FASTQ for downstream bioinformatics analysis"
arch=('i686' 'x86_64')
url=https://support.illumina.com/downloads/"${pkgname//-rpm/}"-conversion-software-v"${pkgver//./-}".html
license=('custom')
depends=('rpmextract')
provides=('bcl2fastq')
conflicts=('bcl2fastq')
source=(ftp://webdata2:webdata2@ussd-ftp.illumina.com/downloads/software/"${pkgname//-rpm/}"/"${pkgname//-rpm/}"2-v"${pkgver}"-Linux-x86_64.zip)
md5sums=('927f15930ae40392c718059d6147d1a3')

build() {
  cd "${srcdir}"
  rpmextract.sh bcl2fastq2-v"${pkgver}"-Linux-x86_64.rpm
}

package() {
  install -Dm755 "${srcdir}"/usr/local/bin/bcl2fastq "${pkgdir}"/usr/bin/bcl2fastq
  install -Dm644 "${srcdir}"/usr/local/share/COPYRIGHT "${pkgdir}"/usr/share/licenses/bcl2fastq/COPYRIGHT
}
