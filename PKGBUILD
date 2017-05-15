# Maintainer: Chris Gregory <czipperz@gmail.com>
pkgname=libclipboard-git
pkgver=1.0.2
pkgrel=1
pkgdesc="Lightweight cross-platform C clipboard library"
url="https://github.com/czipperz/libclipboard"
arch=("i686" "x86_64")
license=("MIT")
depends=("libxcb")
makedepends=("cmake" "git")
provides=("libclipboard")
source=("git://github.com/czipperz/libclipboard")
sha256sums=("SKIP")

build() {
    cd libclipboard
    cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd libclipboard
    make DESTDIR="${pkgdir}" install
}
