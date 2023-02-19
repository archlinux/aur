#!/bin/bash

pkgname=dpatch
_pkgver="2.0.41"
_deblevel=""
pkgver="${_pkgver}${_deblevel}"
pkgrel=2

pkgdesc="A easy to use patch system for Debian packages, somewhat similar to the dbs package, but much simpler to use."
url="https://packages.debian.org/stable/dpatch"
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
  '267461f5998ad7472aeb50f7d66708518d51923ca79bb16a3726e24e5ab3a8b2'
)

noextract=(
  "dpatch_${_pkgver}${_deblevel}_all.deb"
)

package() {
  cd "${srcdir}"
  msg "Extracting files with dpkg-deb to \$pkgdir ..."
  dpkg-deb -x "dpatch_${_pkgver}${_deblevel}_all.deb" "${pkgdir}"
}
