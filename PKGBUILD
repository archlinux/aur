# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_cranname=ggpmisc
_cranver=0.4.7
_updatedate=2022-06-25
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
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('ebf91f579c54362409253cc18195018077645ea3347202cfc6002a9427911409ab360e07c4ed293a0a6d5cabb43f39fb305547ab5723c82909f3874c2249320b')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

