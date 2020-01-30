# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=Biobase
_bcver=2.46.0
pkgname=r-biobase
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Biobase: Base functions for Bioconductor"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
arch=(i686 x86_64)
license=('Artistic-2.0')
depends=('r>=2.10' 'r-biocgenerics>=0.27.1')
makedepends=('gcc')
optdepends=('r-tkwidgets' 'r-all' 'r-runit' 'r-golubesets')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha1sums=('4dcd9a29ce30fb8ca2d3d62f721e9c88853245ae')

build(){
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l $srcdir
}

package() {
  cd "${srcdir}"

  install -dm0755 "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "$_bcname" "$pkgdir/usr/lib/R/library"
}
