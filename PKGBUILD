_cranname=fanplot
_cranver=4.0.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Visualisation of Sequential Probability Distributions Using Fan Charts"
arch=(any)
url="http://guyabel.github.io/fanplot/"
license=(GPL3)
depends=('r>=2.10' r-shiny)
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(6cce0c5295629e627c1f188d6a5abfd2004a18d93ac4fe67cb012a239c12ed23)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
