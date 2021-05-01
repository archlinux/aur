# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
# Maintainer: chn <g897331845@gmail.com>

pkgname=xproperty
pkgver=0.11.0
pkgrel=1
pkgdesc="xproperty is a C++ library providing traitlets-style properties."
arch=('x86_64')
url="https://github.com/jupyter-xeus/xproperty"
license=('BSD')
depends=('xtl')
makedepends=('cmake')
source=("https://github.com/jupyter-xeus/$pkgname/archive/$pkgver.tar.gz")
md5sums=('253c1e16b5250af122052313f7f50234')

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
