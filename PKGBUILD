# Maintainer: Liliane Fontenot <projects@liliane.io>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-xword-dl
pkgver=0.5.0
pkgrel=1
pkgdesc='English puzzles from xword-dl for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/jrb/puzzle-sets-xword-dl'
license=(GPL-3.0-or-later)
makedepends=(meson)
_srcdir="puzzle-sets-xword-dl-${pkgver}"
source=("${url}/-/archive/${pkgver}/${_srcdir}.tar.gz")
sha256sums=('cd2a2388ee36e651a0d15af1de58242a85d009fc531498fb2d8a14163f1b6806')

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
