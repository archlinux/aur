# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libanimation
pkgver=3.7.5
pkgrel=1
pkgdesc="Library that provides animation calculations"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/endlessm/libanimation"
license=(LGPL)
depends=(glib2)
makedepends=(meson
             gobject-introspection
             gmock
             gtest)
source=("https://github.com/endlessm/libanimation/archive/Release_${pkgver}.tar.gz")
sha256sums=('bce5760c54ec3469ca59addfad707c2883bf4f1eee8da9a6b14f82edc847a2bb')

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
