# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=stringi
_cranver=1.6.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Character String Processing Facilities"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(custom)
depends=('r>=3.1' 'icu>=55')
source=("${pkgname}-${pkgver}.tar.gz::https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('3a151dd9b982696370ac8df3920afe462f8abbd4e41b479ff8b66cfd7b602dae')
noextract=("${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}"

  R CMD INSTALL ${pkgname}-${pkgver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
