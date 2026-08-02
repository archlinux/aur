# Maintainer: Erwin Iosef <erwiniosef@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-gnome
pkgver=0.4.5
pkgrel=1
pkgdesc='Additional official English puzzles for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/jrb/puzzle-sets-gnome'
license=('GPL-3.0-or-later')
depends=('crosswords')
makedepends=('meson')
_srcdir="puzzle-sets-gnome-${pkgver}"
source=("${url}/-/archive/${pkgver}/${_srcdir}.tar.gz")
b2sums=('21f84f685a727df82fb32980da6041337d19b1e0baa011c47bceae3b82fb29f8e3f0a9fb2bbbc183d43874512c5308d3787165ff2dcdc2a131e9170ff3a7ef16')

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
