# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=libsitra
pkgver=0.1.0
pkgrel=1
pkgdesc='A library to list, and manage online fonts on your system'
arch=('aarch64' 'x86_64')
url='https://github.com/sitraorg/libsitra'
license=('GPL-3.0-or-later')
depends=('glib2' 'json-glib' 'libgee' 'libsoup3')
makedepends=('git' 'meson' 'vala')
source=("${pkgname}::git+https://github.com/sitraorg/${pkgname}.git#tag=v${pkgver}")
b2sums=('f1cd7c519a569be2e87213d51f909095c60a8d9bec54de78ffa482619b3419438a0c79239ca9c086d3cf948728524ac10f1626f907268a000213dc3c6a9c5d44')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
