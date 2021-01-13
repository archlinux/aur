# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=BH
_cranver=1.75.0-0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Boost C++ Header Files"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(BSL1.0)
depends=(r)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('ae4c10992607dd697663f60675a46a5770851da159330bb63c4a68890bdd6f5a')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
