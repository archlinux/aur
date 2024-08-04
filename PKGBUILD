# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-xword-dl
pkgver=0.4.7
pkgrel=1
pkgdesc='English puzzles from xword-dl for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/jrb/puzzle-sets-xword-dl'
license=(GPL3)
depends=(crosswords xword-dl)
makedepends=(meson)
_srcdir="puzzle-sets-xword-dl-${pkgver}"
source=("${url}/-/archive/${pkgver}/${_srcdir}.tar.gz")
sha256sums=('c550b1bd85bcd7d76d78a396a508d3fd6981d0704351fa0dbcaad99454a5e232')

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
