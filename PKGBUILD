# Maintainer: Dringsim <dringsim@qq.com>

_cranname=matconv
_cranver=0.4.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Code Converter from the Matlab/Octave Language to R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r')
makedepends=()
optdepends=('r-knitr'
	'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('63F1D853729B8330610DF45F27845AF46AF85307F9CFC4DFE84EBB710919DEC7')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}