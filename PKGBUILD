# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libipuz
pkgver=0.4.2
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL)
depends=(json-glib)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/libipuz-${_commit}.tar.gz")
b2sums=('91249b986652a620d6b53b3e2dc41c05d9d8b8e61b7a567df3dc2461a2ed3c34d9d64542fe1ea9b2fa38da1a33d093b0f2273ccc157301012f865ad42337c8dd')

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
