# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranname=testthat
_cranver=2.3.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Unit Testing for R"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1' r-cli 'r-crayon>=1.3.4' r-digest r-ellipsis r-evaluate r-magrittr r-pkgload r-praise 'r-r6>=2.2.0' 'r-rlang>=0.4.1' 'r-withr>=2.0.0')
makedepends=(gcc)
optdepends=(r-covr r-curl r-devtools r-knitr r-rmarkdown r-usethis r-vctrs r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('0e9ed62b4d94f9b7fa1ad353a5372690')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
