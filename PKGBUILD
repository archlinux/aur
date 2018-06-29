#!/bin/bash

pkgname=dpatch
_pkgver="2.0.38"
_deblevel="+nmu1"
pkgver="${_pkgver}${_deblevel}"
pkgrel=1

pkgdesc="A easy to use patch system for Debian packages, somewhat similar to the dbs package, but much simpler to use."
url="http://packages.debian.org/unstable/dpatch"
license=('GPL2')

arch=(
  'any'
)

depends=(
  'debhelper'
  'dpkg'
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
  'd31edd4f5e7f769b66aabb67cc76e5b6e4c10c64becd2d60dc18b6f3c95bda5a'
)

noextract=(
  "dpatch_${_pkgver}${_deblevel}_all.deb"
)

package() {
  cd "${srcdir}"
  msg "Extracting files with dpkg-deb to \$pkgdir ..."
  dpkg-deb -x "dpatch_${_pkgver}${_deblevel}_all.deb" "${pkgdir}"
}
