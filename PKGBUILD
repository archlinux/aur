# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=sfeed_curses
pkgname=sfeed-curses
pkgver=0.1
pkgrel=1
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('x86_64')
url='https://www.codemadness.org/sfeed_curses-ui.html'
license=('ISC')
depends=('ncurses')
options=('!buildflags')
source=("https://codemadness.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e436421b6e598caa9809d888694e0fa1cb38cf742c2bfdb6dbe9362a174537b7')

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${_pkgname}-${pkgver}" install
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
