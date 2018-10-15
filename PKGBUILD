# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libminigbm-git
pkgver=r305.ee98f4ec
pkgrel=1
pkgdesc="Generic Buffer Management (GBM) implementation used in Chromium OS"
arch=(i686 x86_64 armv6h armv7h)
url="https://chromium.googlesource.com/chromiumos/platform/minigbm/"
license=(custom)
makedepends=(clang)
provides=(libminigbm)
conflicts=(libminigbm mesa)
source=("git+https://chromium.googlesource.com/chromiumos/platform/minigbm")
md5sums=(SKIP)

pkgver() {
    cd minigbm
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd minigbm
    make CC=clang
}

package() {
    cd minigbm
    make DESTDIR="${pkgdir}" install
}
