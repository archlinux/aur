# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libanimation
pkgver=3.5.6
pkgrel=1
pkgdesc="Library that provides animation calculations"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/endlessm/libanimation"
license=(LGPL)
depends=(glib2)
makedepends=(meson gmock gtest glib2)
conflicts=(libanimation-git)
source=("https://github.com/endlessm/libanimation/archive/Release_${pkgver}.tar.gz")
sha256sums=('ad31587b2ca148e64d62716125788d489ccd6ec855eb3ad9f8030e5edaf306e8')

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
