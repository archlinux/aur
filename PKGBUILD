# Maintainer: ikyope at outlook dot com
# Contributor: Alex Hirzel <alex at hirzel period us>
# Contributor: Matteo De Carlo matteo [dot] dek [at] gmail [dot] com

_pkgname=pbdZMQ
_pkgver=0.3-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc="Programming with Big Data - Interface to 'ZeroMQ'"
arch=("x86_64")
url="https://CRAN.R-project.org/package=${_pkgname}"
license=('GPL-3.0-only')
depends=('r' 'zeromq')
source=("${_pkgname}_${_pkgver}.tar.gz::https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha512sums=('7b05ed1dc1c7c63a6925210c8189319c0c6147860337756349a35af2b28d74f60a6adfaad49c739c61883a8a23242e42fd0cf79cb5f1fc1b512760eaa05f8d11')

build() {
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_pkgname}" "$pkgdir/usr/lib/R/library"
}
