# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=sfeed_curses
pkgname=sfeed-curses
pkgver=0.8.2
pkgrel=1
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('x86_64')
url='https://www.codemadness.org/sfeed_curses-ui.html'
license=('ISC')
depends=('ncurses')
optdepends=('sfeed: RSS and Atom parser')
options=('!buildflags')
source=("https://codemadness.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('adf4b61dc521f6fe8933ed9b574458cf05a042e4802b06de07f3dab090077b97')

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${_pkgname}-${pkgver}" install
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
