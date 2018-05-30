# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=utf8
_cranver=1.1.4
pkgname="r-cran-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="R functions for processing and printing UTF-8 encoded unicode"
url=http://cran.r-project.org/web/packages/"${_cranname}"/index.html
arch=('i686' 'x86_64')
license=('Apache')
depends=('r')
conflicts=('r-utf8')
provides=('r-utf8')
source=(http://cran.r-project.org/src/contrib/"${_cranname}"_"${_cranver}".tar.gz)
sha256sums=('f6da9cadfc683057d45f54b43312a359cf96ec2731c0dda18a8eae31d1e31e54')

package() {
  mkdir -p "${pkgdir}/usr/lib/R/library"
  cd "${srcdir}"
  R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
