# Maintainer: Michael Piccirilli <michaelpiccirilli3@gmail.com>

pkgname=nxpp
pkgver=1.0.21
pkgrel=1
pkgdesc="Header-only C++20 graph utilities on top of Boost Graph Library"
arch=('any')
url="https://github.com/Mik1810/nxpp"
license=('MIT')
depends=('boost')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mik1810/nxpp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1b69cc47d1f50273aa8bc996936788ea40d42f6be63f400289fa85fcd636bd0d')

build() {
    cmake -S "$srcdir/$pkgname-$pkgver" \
          -B "$srcdir/$pkgname-$pkgver/build" \
          -DCMAKE_BUILD_TYPE=None \
          -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
