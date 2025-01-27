# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
# Maintainer: chn <g897331845@gmail.com>

pkgname=xproperty
pkgver=0.12.0
pkgrel=1
pkgdesc="xproperty is a C++ library providing traitlets-style properties."
arch=('x86_64')
url="https://github.com/jupyter-xeus/xproperty"
license=('BSD')
depends=('xtl')
makedepends=('cmake')
source=("https://github.com/jupyter-xeus/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('27cbc8e441dcc515a1ebbf11bad5ef240748d32f5e1adf84deed87a1dc57a440')

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
