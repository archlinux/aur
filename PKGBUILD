# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=IRanges
_bcver=2.20.2
pkgname=r-iranges
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Foundation of integer range manipulation in Bioconductor"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
arch=(i686 x86_64)
license=('Artistic-2.0')
depends=('r>=3.1.0' 'r-biocgenerics>=0.25.3' 'r-s4vectors>=0.23.22')
makedepends=('gcc')
optdepends=('r-xvector' 'r-genomicranges' 'r-rsamtools' 'r-genomicalignments' 'r-genomicfeatures' 'r-bsgenome.celegans.ucsc.ce2' 'r-pasillabamsubset' 'r-runit' 'r-biocstyle')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha1sums=('43b6501d37212513cbc2bacc2ad348d3baa07ede')

build(){
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l $srcdir
}

package() {
  cd "${srcdir}"

  install -dm0755 "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "$_bcname" "$pkgdir/usr/lib/R/library"
}

