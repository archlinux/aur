# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=json2tsv
pkgname=${_pkgname}-git
pkgver=0.5.r2.gdf5cda0
pkgrel=1
pkgdesc="JSON to TSV converter"
arch=('x86_64')
url="https://codemadness.org/${_pkgname}.html"
license=('custom:ISC license')
source=("git://git.codemadness.org/${_pkgname}")
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}