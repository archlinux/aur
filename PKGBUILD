# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_cranname=ggpmisc
_cranver=0.4.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provide for uniform handling of R's different time-based data classes by extending zoo, maximizing native format information preservation and allowing for user level customization and extension, while simplifying cross-class interoperability."
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=('r>=3.6.0' 'r-ggpp>=0.4.2')
makedepends=(r-splus2r r-lmodel2 r-plyr)
optdepends=(r-knitr r-rmarkdown r-ggrepel r-broom r-broom.mixed r-nlme r-gginnards)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('6036065614dd6a443336ebc994e04458df1a56f3761268da369daaa74d508d54a00b3d916aa0fe86e1a9c1aa91c96e4819d340c54ff91d97c76577276b03381b')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

