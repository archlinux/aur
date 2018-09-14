# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libanimation
pkgver=0.3.2
pkgrel=1
pkgdesc="Library that provides animation calculations"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/endlessm/libanimation"
license=(LGPL)
depends=(glib2)
makedepends=(meson)
conflicts=(libanimation-git)
source=("https://github.com/endlessm/libanimation/archive/Version_${pkgver}.tar.gz")
md5sums=(SKIP)

build() {
    rm -rf build
    arch-meson ${pkgname}-Version_${pkgver} build
    ninja -v -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}