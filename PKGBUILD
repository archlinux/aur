# Maintainer zan <zan@420blaze.it>

pkgname=dotherside-git
pkgver=v0.6.5.r16.ga7bfa38
pkgrel=1
pkgdesk="C language library for creating bindings for the Qt QML language "
arch=(x86_64)
url="https://github.com/filcuc/dotherside"
license=(LGPL)
depends=(qt5-quickcontrols2)
makedepends=(cmake git)
source=("git+https://github.com/filcuc/dotherside.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -S ${pkgname%-git}
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
