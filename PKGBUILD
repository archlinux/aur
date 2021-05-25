# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=ids
_cranver=0.1-4
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-ids
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Generate random or human readable and pronounceable identifiers."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.2' 'r-openssl' 'r-uuid')
optdepends=('r-knitr' 'r-rcorpora' 'r-rmarkdown' 'r-testthat')


sha256sums=('b6212a186063c23116c5cbd3cca65dbb8977dd737261e4526ebee8f64852cfe8')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")

build(){
cd "${srcdir}"
R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
cd "${scrdir}"
install -dm0755 "$pkgdir/usr/lib/R/library"
cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
