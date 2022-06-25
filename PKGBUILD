# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=TraMineR
_cranver=2.2-4
_updatedate=2022-06-25
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Trajectory Miner: a Toolbox for Exploring and Rendering Sequences"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(
	r
	r-cluster
	r-colorspace
	r-rcolorbrewer
	r-weights
	r-cnorm
	r-boot
)
optdepends=(
	r-xtable
	r-traminerextras
)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('b69ef547443453f1d814d09141f7b9be1dd09ef374cc50771d1a8d3f0815e1a7')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

