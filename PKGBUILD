# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sauliusl <luksaulius[at]gmail[dotcom]>

pkgname=sra-tools-bin
_pkgname=sra-tools
pkgver=2.10.5
pkgrel=1
pkgdesc="The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives"
arch=('x86_64')
provides=('sra-tools' 'sratoolkit')
url="http://www.ncbi.nlm.nih.gov/books/NBK158900/"
license=('custom')
groups=('sequence_analysis')
depends=('libxml2' 'gcc-libs-multilib' 'fuse')
source=("http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${pkgver//_/-}/sratoolkit.${pkgver//_/-}-ubuntu64.tar.gz"
        "https://raw.githubusercontent.com/ncbi/sra-tools/master/LICENSE")
md5sums=('d68cd7ec55b47269853f9f77adfaccf8'
         '9ba753649b72f0bbcac5741536c6953d')

package() {
  pkgverdash=${pkgver//_/-}
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/doc/${_pkgname}
  install -d ${pkgdir}/usr/share/doc/${_pkgname}/example/perl
  install -dm644 ${pkgdir}/usr/share/${_pkgname}/
  cp -ar $srcdir/sratoolkit.$pkgverdash-ubuntu64/schema ${pkgdir}/usr/share/${_pkgname}/
  cp -ar $srcdir/sratoolkit.$pkgverdash-ubuntu64/bin/* ${pkgdir}/usr/bin/
  install -Dm755 $srcdir/sratoolkit.$pkgverdash-ubuntu64/example/perl/* ${pkgdir}/usr/share/doc/${_pkgname}/example/perl/
  install -Dm644 $srcdir/sratoolkit.$pkgverdash-ubuntu64/README* ${pkgdir}/usr/share/doc/${_pkgname}
  install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}
}