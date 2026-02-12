# Maintainer: Erwin Iosef <erwiniosef@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-gnome
pkgver=0.4.4
pkgrel=1
pkgdesc='Additional official English puzzles for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/jrb/puzzle-sets-gnome'
license=('GPL-3.0-or-later')
depends=('crosswords')
makedepends=('meson')
_srcdir="puzzle-sets-gnome-${pkgver}"
source=("${url}/-/archive/${pkgver}/${_srcdir}.tar.gz")
b2sums=('c8923fa9155ca81be00d637fbdb2d4f7115ec4e12484f2efe4e30e34cdb44bd5d54e1b11a40db40593c67b450fea5b5529977d645a48e959e146033a8deec5b3')

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
