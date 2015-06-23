# Maintainer: Ben Booth <benwbooth@gmail.com>
pkgname=rmblast
pkgver=2.2.28
pkgrel=4
pkgdesc="RMBlast is a RepeatMasker compatible version of the standard NCBI BLAST suite."
arch=('i686' 'x86_64')
url="http://www.repeatmasker.org/RMBlast.html"
license=('custom')
depends=('blast+-bin')
if test "$CARCH" == x86_64; then
  source=('ftp://ftp.ncbi.nlm.nih.gov/blast/executables/rmblast/LATEST/ncbi-rmblastn-2.2.28-x64-linux.tar.gz')
  md5sums=('b668b3c5869cd7cdde5d44463c8417f9')
elif test "$CARCH" == i686; then
  source=('ftp://ftp.ncbi.nlm.nih.gov/blast/executables/rmblast/LATEST/ncbi-rmblastn-2.2.28-ia32-linux.tar.gz')
  md5sums=('9e78451a710b668d81e5cd8573fa7303')
fi

package() {
  install -d ${pkgdir}/usr/share/licenses/rmblast
  install -D -m644 ${srcdir}/ncbi-rmblastn-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/rmblast

  install -d ${pkgdir}/usr/share/rmblast
  install -D -m644 ${srcdir}/ncbi-rmblastn-${pkgver}/README ${pkgdir}/usr/share/rmblast
  install -D -m644 ${srcdir}/ncbi-rmblastn-${pkgver}/ncbi_package_info ${pkgdir}/usr/share/rmblast

  install -D -m755 ${srcdir}/ncbi-rmblastn-${pkgver}/bin/rmblastn ${pkgdir}/usr/bin/rmblastn
}
