# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RefFreeEWAS
_pkgver=2.2
pkgname=r-${_pkgname,,}
pkgver=2.2
pkgrel=11
pkgdesc=' EWAS using Reference-Free DNA Methylation Mixture Deconvolution'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-quadprog
)
source=("https://github.com/cran/RefFreeEWAS/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7d24a61eb1c80e14b42eb21c3a7482149489673e257917b5f4a7e9638ee83039')

build() {
  R CMD INSTALL ${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
