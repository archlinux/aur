# Maintainer: Sauliusl <luksaulius[at]gmail[dotcom]>
pkgname=sratoolkit
pkgver=2.5.2
pkgrel=1
pkgdesc="A toolkit from NCBI to download SRA data files and reference sequences and to do file format conversions"
arch=('x86_64')
url="http://www.ncbi.nlm.nih.gov/books/NBK158900/"
license=('custom')
groups=('sequence_analysis')
depends=('libxml2' 'gcc-libs-multilib' 'fuse')
source=("http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/$pkgver/sratoolkit.$pkgver-ubuntu64.tar.gz"
        "https://raw.githubusercontent.com/ncbi/sra-tools/master/LICENSE")

sha1sums=('30cf9c8766c9809271de661d83dbd9e15328fef7'
          '189d29edf32eeec2cf10f5d43b3533207f3f3e87')

package() {
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -d ${pkgdir}/usr/share/doc/${pkgname}/example/perl

  cp -r $srcdir/sratoolkit.$pkgver-ubuntu64/bin/* ${pkgdir}/usr/bin/
  install -Dm755 $srcdir/sratoolkit.$pkgver-ubuntu64/example/perl/* ${pkgdir}/usr/share/doc/${pkgname}/example/perl/

  install -Dm644 $srcdir/sratoolkit.$pkgver-ubuntu64/README* ${pkgdir}/usr/share/doc/${pkgname}

  install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
