# Maintainer: Fabio Zanini <fabio _DOT zanini AT_ fastmail DOT_ fm>
pkgname=metabat
pkgver=0.32.4
pkgrel=1
pkgdesc='An Efficient Tool for Accurately Reconstructing Single Genomes from Complex Microbial Communities.'
arch=('i686' 'x86_64')
url="https://bitbucket.org/berkeleylab/metabat"
license=('custom')
depends=('boost>=1.55')
#makedeps=('gcc>=4.9' 'python2' 'scons' 'zlib' 'binutils' 'boost>=1.55')
source=("https://bitbucket.org/berkeleylab/metabat/downloads/metabat-static-binary-linux-x64_v${pkgver}.tar.gz")
md5sums=('66d61662ed0fd9a289210e9fb04ed745')
options=('!emptydirs')

package() {
  cd "${srcdir}/${pkgname}"

  # Precompiled binaries
  install -d "${pkgdir}"/usr/bin
  install -m755 aggregateBinDepths.pl "${pkgdir}"/usr/bin/
  install -m755 aggregateContigOverlapsByBin.pl "${pkgdir}"/usr/bin/
  install -m755 contigOverlaps "${pkgdir}"/usr/bin/
  install -m755 jgi_summarize_bam_contig_depths "${pkgdir}"/usr/bin/
  install -m755 metabat "${pkgdir}"/usr/bin/
  install -m755 runMetaBat.sh "${pkgdir}"/usr/bin/

  # License
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

}
