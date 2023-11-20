# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libipuz
pkgver=0.4.4
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL)
depends=(json-glib)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/libipuz-${_commit}.tar.gz")
b2sums=('f60f5518fc63e036a64de55affeace752733120fd0a4abbd8b18b9e8f076ba3f78fc8c6eaaf11e93f4f009dafc76f20ff990c4be21840c97983e0661aba349f3')

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
