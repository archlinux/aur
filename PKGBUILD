# Maintainer: Yousef El-Darsh <yousef.eldarsh@gmail.com>

pkgname="fabric-cli-git"
pkgdesc="an alternative cli for fabric"
url="https://github.com/Fabric-Development/fabric-cli"
pkgrel=1
pkgver=0.0.2
license=("AGPL3")
provides=("fabric-cli")
arch=("x86_64")
source=("git+${url}.git")
depends=()
makedepends=("meson" "ninja" "go")
conflicts=("fabric-cli")

sha256sums=("SKIP")

build() {
    cd "$srcdir/fabric-cli"
    arch-meson build
}

package() {
    cd "$srcdir/fabric-cli/build"
    meson install --destdir "$pkgdir"
}

