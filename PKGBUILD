#!/bin/bash

pkgname=dpatch
_pkgver="2.0.40"
_deblevel=""
pkgver="${_pkgver}${_deblevel}"
pkgrel=2

pkgdesc="A easy to use patch system for Debian packages, somewhat similar to the dbs package, but much simpler to use."
url="http://packages.debian.org/unstable/dpatch"
license=('GPL2')

arch=(
  'any'
)

depends=(
  'debhelper'
  'dpkg'
  'make'
  'perl'
)
makedepends=()
optdepends=(
  'fakeroot'
  'patchutils'
  'curl'
)
provides=()
replaces=()
conflicts=()

options=('emptydirs')

source=(
  "dpatch_${_pkgver}${_deblevel}_all.deb::http://http.debian.net/debian/pool/main/d/dpatch/dpatch_${_pkgver}${_deblevel}_all.deb"
)

sha256sums=(
  'a79ca01f1a7e90c3e969d7bba204fe92a7e6832a3bd07f7ee153678bd34f3453'
)

noextract=(
  "dpatch_${_pkgver}${_deblevel}_all.deb"
)

package() {
  cd "${srcdir}"
  msg "Extracting files with dpkg-deb to \$pkgdir ..."
  dpkg-deb -x "dpatch_${_pkgver}${_deblevel}_all.deb" "${pkgdir}"
}
