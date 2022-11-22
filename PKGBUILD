# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libipuz
pkgver=0.3.0
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL)
depends=(json-glib)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/libipuz-${_commit}.tar.gz")
b2sums=('7c95cac07987ba1d5a3614b071fa545fc80b3ad271bb42a3533da8c6f2a286e4e73bcfedb35a03ae55c148602e0701fa51515d5d58975706a8005821117f00cd')

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
