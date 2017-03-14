# Maintainer: Sauliusl <luksaulius[at]gmail[dotcom]>
pkgname=sratoolkit
pkgver=2.8.2_1
pkgrel=1
pkgdesc="A toolkit from NCBI to download SRA data files and reference sequences and to do file format conversions"
arch=('x86_64')
url="http://www.ncbi.nlm.nih.gov/books/NBK158900/"
license=('custom')
groups=('sequence_analysis')
depends=('libxml2' 'gcc-libs-multilib' 'fuse')
source=("http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${pkgver//_/-}/sratoolkit.${pkgver//_/-}-ubuntu64.tar.gz"
        "https://raw.githubusercontent.com/ncbi/sra-tools/master/LICENSE")

sha1sums=('ab2adff5e32c99e13f7d250d0a4730a62555ad0f'
          '189d29edf32eeec2cf10f5d43b3533207f3f3e87')

package() {
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -d ${pkgdir}/usr/share/doc/${pkgname}/example/perl

  pkgverdash=${pkgver//_/-}

  cp -r $srcdir/sratoolkit.$pkgverdash-ubuntu64/bin/* ${pkgdir}/usr/bin/
  install -Dm755 $srcdir/sratoolkit.$pkgverdash-ubuntu64/example/perl/* ${pkgdir}/usr/share/doc/${pkgname}/example/perl/

  install -Dm644 $srcdir/sratoolkit.$pkgverdash-ubuntu64/README* ${pkgdir}/usr/share/doc/${pkgname}

  install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
