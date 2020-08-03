# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=sfeed_curses
pkgname=${_pkgname/_/-}
pkgver=0.9
pkgrel=1
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('x86_64')
url='https://www.codemadness.org/sfeed_curses-ui.html'
license=('ISC')
depends=('ncurses')
optdepends=('sfeed: RSS and Atom parser')
options=('!buildflags')
source=("https://codemadness.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ab97697bebec6c15143422df3be37a655300488913b7482f048127e8301f12b8')

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${_pkgname}-${pkgver}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}-${pkgver}/LICENSE"
}

# vim: ts=2 sw=2 et:
