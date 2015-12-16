# Maintainer: Tarcisio Fedrizzi <tarcisio.fedrizzi@gmail.com>

pkgname='tbl2asn'
pkgver='24.3'
pkgrel='1'
pkgdesc='A command-line program that automates the creation of sequence records for submission to GenBank'
arch=('i686' 'x86_64')
url='http://www.ncbi.nlm.nih.gov/genbank/tbl2asn2/'
license=('unknown')
makedepends=('gzip')
source_i686=('ftp://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux.tbl2asn.gz')
source_x86_64=('ftp://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux64.tbl2asn.gz')
sha256sums_i686=('1c0fcf83b5dac532a281ad8510b3d8c2056b144d500f8a26f7fb235200a77979')
sha256sums_x86_64=('00265752e4b69f17e2e1066e42187bf0f65126ce3a2c6ac4bc2fd6ddae139163')
_prog_name='linux'$([[ $CARCH == 'x86_64' ]] && echo -n '64' || echo -n '')'.tbl2asn'

prepare() {
  gunzip < ${_prog_name}.gz > $pkgname
}

package() {
  install -Dp "${srcdir}/${_prog_name}" "${pkgdir}/usr/bin/${pkgname}"
}
