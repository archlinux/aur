# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=sandwich
_cranver=3.0-1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Robust Covariance Matrix Estimators"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.0.0' r-zoo)
optdepends=(r-aer r-car r-geepack r-lmtest r-multiwayvcov r-pcse r-plm r-pscl r-scatterplot3d r-strucchange)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('f6584b7084f3223bbc0c4722f53280496be73849747819b0cb4e8f3910284a89')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
