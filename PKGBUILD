# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libanimation
pkgver=3.7.8
pkgrel=1
pkgdesc="Library that provides animation calculations"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/endlessm/libanimation"
license=(LGPL)
depends=(glib2)
makedepends=(meson
             gobject-introspection
             gmock
             gtest)
source=("https://github.com/endlessm/libanimation/archive/Release_${pkgver}.tar.gz")
sha256sums=('cb890ec9710df457354b5b297dca05601043f6222695df911e73a2f533de9966')

build() {
    arch-meson ${pkgname}-Release_${pkgver} build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
