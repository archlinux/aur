# Maintainer: ikyope at outlook dot com
# Contributor: Alex Hirzel <alex at hirzel period us>
# Contributor: Matteo De Carlo matteo [dot] dek [at] gmail [dot] com

_pkgname=pbdZMQ
_pkgver=0.3-13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Programming with Big Data - Interface to 'ZeroMQ'"
arch=("x86_64")
url="https://CRAN.R-project.org/package=${_pkgname}"
license=('GPL-3.0-only')
depends=('r' 'zeromq')
source=("${_pkgname}_${_pkgver}.tar.gz::https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha512sums=('4f8e23499d86b4ccf724d2a15da613871d5ef9dbf7ff332bf500daf6c254abeca1b4fbee221c71218e840c1d1d23154bfee2ab846f8d30e0989177e6ff89d76b')

build() {
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_pkgname}" "$pkgdir/usr/lib/R/library"
}
