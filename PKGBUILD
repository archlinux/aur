# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sfeed_curses'
pkgname="${_pkgname/_/-}"
pkgver=0.9.7
pkgrel=1
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('x86_64')
url='https://www.codemadness.org/sfeed_curses-ui.html'
_url_source='https://codemadness.org/releases/sfeed_curses'
license=('ISC')
depends=('ncurses')
optdepends=('sfeed: RSS and Atom parser')
source=("${_url_source}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b45617e410894290bb1d5ca24d1ffb114b3eeaff4aa3d2830d15a465943d03ec')

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${_pkgname}-${pkgver}" install
  install -Dvm644 "${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
