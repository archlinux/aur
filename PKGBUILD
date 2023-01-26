# system requirements: By default, git2r uses a system installation of thelibgit2 headers and library. However, if a system installationis not available, builds and uses a bundled version of thelibgit2 source. zlib headers and library. OpenSSL headers andlibrary (non-macOS). LibSSH2 (optional on non-Windows) toenable the SSH transport.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=git2r
_pkgver=0.31.0
pkgname=r-${_pkgname,,}
pkgver=0.31.0
pkgrel=1
pkgdesc='Provides Access to Git Repositories'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  openssl
  openssh
  libgit2
)
optdepends=(
  r-getpass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f1db9278fa4604600a64beaedcf86dda595d7c8a10cdb1f7300a6635e73cd66d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
