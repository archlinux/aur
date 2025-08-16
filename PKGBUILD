# Maintainer: Liliane Fontenot <projects@liliane.io>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-xword-dl
pkgver=0.4.9
pkgrel=1
pkgdesc='English puzzles from xword-dl for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/jrb/puzzle-sets-xword-dl'
license=(GPL-3.0-or-later)
makedepends=(meson)
_srcdir="puzzle-sets-xword-dl-${pkgver}"
source=("${url}/-/archive/${pkgver}/${_srcdir}.tar.gz")
sha256sums=('c2bb988f8fca6b3a3533eeaceef6a2cf5a3255bf2d60b084cd21b00d3b38aa8c')

build() {
	arch-meson "${_srcdir}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
