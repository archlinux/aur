# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libipuz
pkgver=0.4.0
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL)
depends=(json-glib)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/libipuz-${_commit}.tar.gz")
b2sums=('acff0a9e149b69cc06bd341ce9ca9a5308bdf87d4edc4a410e6847b33fb7c1158c8bf8a506219652311d154b16c65ca37a896e06fb2fbdafe0bcaba67a806945')

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
