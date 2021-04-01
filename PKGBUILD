# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sfeed_curses'
pkgname="${_pkgname/_/-}"
pkgver=0.9.10
pkgrel=1
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('any')
url='https://www.codemadness.org/sfeed_curses-ui.html'
_url_source='https://codemadness.org/releases/sfeed_curses'
license=('ISC')
depends=('ncurses')
optdepends=('sfeed: RSS and Atom parser')
source=("${_url_source}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d64a64116cd16ba00c592ca08a8d545d2fa91c2cf9cf8673e2f0b6c7b101b2db')

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${_pkgname}-${pkgver}" install
  install -Dvm644 "${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
