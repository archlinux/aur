# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='json2tsv'
pkgname=${_pkgname}-git
pkgver=0.5.r2.gdf5cda0
pkgrel=2
pkgdesc='JSON to TSV converter'
arch=('x86_64')
url='https://codemadness.org/json2tsv.html'
license=('ISC')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://git.codemadness.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${_pkgname}" install
  install -Dvm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
