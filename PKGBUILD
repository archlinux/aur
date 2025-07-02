# Maintainer: Erwin Iosef <erwiniosef@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-gnome
pkgver=0.4.3
pkgrel=1
pkgdesc='Additional official English puzzles for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/jrb/puzzle-sets-gnome'
license=(GPL-3.0-or-later)
depends=(crosswords)
makedepends=(meson)
_srcdir="puzzle-sets-gnome-${pkgver}"
source=("${url}/-/archive/${pkgver}/${_srcdir}.tar.gz")
b2sums=('9a66e303f09a31b596417705a05ca742cb633309476b65f0a970d2b847811270cc3c86cf7bf4db22c7f29fd177ccb3e74b66869b7b7878b762e30998524090ec')

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
