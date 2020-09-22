# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=xproperty
pkgver=0.10.3
pkgrel=2
pkgdesc="xproperty is a C++ library providing traitlets-style properties."
arch=('x86_64')
url="https://github.com/jupyter-xeus/xproperty"
license=('BSD')
depends=('xtl')
makedepends=()
source=("https://github.com/jupyter-xeus/$pkgname/archive/$pkgver.tar.gz")
md5sums=('cea0397f43507d62140ae8df4e20b0b3')

build() {
    cd "$pkgname-$pkgver"
    mkdir build
    cd build

    cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "build"

    make DESTDIR="$pkgdir" install
}
