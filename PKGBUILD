# Maintainer: Changqing <wang.ch[at]wehi[dot]edu[dot]au>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sauliusl <luksaulius[at]gmail[dotcom]>

pkgname=sra-tools-bin
_pkgname=sra-tools
pkgver=3.1.1
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives"
arch=('x86_64')
provides=('sra-tools' 'sratoolkit')
url="http://www.ncbi.nlm.nih.gov/books/NBK158900/"
license=('custom')
groups=('sequence_analysis')
depends=('zlib' 'gcc-libs-multilib' 'fuse' 'perl')
source=("${pkgname}-${pkgver}.tar.gz::https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${pkgver//_/-}/sratoolkit.${pkgver//_/-}-ubuntu64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/ncbi/sra-tools/master/LICENSE")
sha256sums=('b668dbfa2e93041746d1c313691272aea4b9ea52b291d7afb79d46dc05367688'
            '122edf134e4230505179e9a1891ac3fea334f1b67d767933e9e86dc5b49adfdb')

package() {
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/doc/${_pkgname}
  install -d ${pkgdir}/usr/share/doc/${_pkgname}/example/perl
  install -dm644 ${pkgdir}/usr/share/${_pkgname}/
  cp -ar $srcdir/sratoolkit.${_pkgver}-ubuntu64/schema ${pkgdir}/usr/share/${_pkgname}/
  cp -ar $srcdir/sratoolkit.${_pkgver}-ubuntu64/bin/* ${pkgdir}/usr/bin/
  install -Dm755 $srcdir/sratoolkit.${_pkgver}-ubuntu64/example/perl/* ${pkgdir}/usr/share/doc/${_pkgname}/example/perl/
  install -Dm644 $srcdir/sratoolkit.${_pkgver}-ubuntu64/README* ${pkgdir}/usr/share/doc/${_pkgname}
  install -Dm644 $srcdir/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
