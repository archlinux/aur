# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libipuz
pkgver=0.4.1
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL)
depends=(json-glib)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/libipuz-${_commit}.tar.gz")
b2sums=('90b2d7f85c65e937bb80e366a6b5c676811af33bf3ac860639ed6c8f817e58653f6eaa7ac38077cd9f4711a2a9e5b0f9e15172336893207f519f14ec643c3b8f')

build() {
	arch-meson "${pkgname}-${_commit}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
