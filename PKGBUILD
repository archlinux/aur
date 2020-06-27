# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=libanimation
pkgver=3.8.3
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
sha256sums=('41c4ff7f65e862b8d3ca792ba20f66f6161d976d4b3259c50c250b0f028b996b')

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
