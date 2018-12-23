# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=virtboard
pkgver=0.0.5
pkgrel=1
pkgdesc="Basic keyboard, blazing the path of modern Wayland keyboards"
url="https://source.puri.sm/Librem5/virtboard"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h)
depends=()
makedepends=(git
             pkg-config
             meson)
conflicts=(virtboard-git)
source=("https://source.puri.sm/Librem5/virtboard/-/archive/v${pkgver}/virtboard-v${pkgver}.tar.gz")
sha256sums=('e026f41c7aa589293458d1ab177b1f5c328f2ad2825b0a1b8ce197407fcb72f1')

build() {
    arch-meson "virtboard-v${pkgver}" build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
