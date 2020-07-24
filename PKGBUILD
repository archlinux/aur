# Maintainer: haha662 <haha662 at outlook dot com>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=tinytex
_cranver=0.25
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Helper Functions to Install and Maintain 'TeX Live', and Compile 'LaTeX' Documents"
arch=("any")
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT" "custom")
depends=("r" "r-xfun>=0.5")
# makedepends=()
optdepends=("r-textit" "r-rstudioapi")
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz" "https://cran.r-project.org/web/packages/tinytex/LICENSE")
sha256sums=("ead3d70e6b3dab3f6942e9797b902f9a5b76ee396429dffd4ab24d2a7bff707d" "f58c2f5b0f10b231d9cea9bc4ea0d849cd4279a21d03257be8dc9fd9452fad37")

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
