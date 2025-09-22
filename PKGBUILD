# Maintainer: Shin Morisawa <me@tryh4rd.dev>
pkgname=liblogger
pkgver=0.0.3
pkgrel=1
pkgdesc="a simple, elegent log library in C"
arch=('x86_64')
url="https://github.com/shinmorisawa/liblogger"
license=('MIT')
depends=()
makedepends=('pkgconf' 'meson' 'ninja' 'gcc')
source=("https://files.tryh4rd.dev/liblogger-releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0a2cda70de12cc686bdd221397881d6f8fa32ce4ec896d51e71f2fbdeb009c93')

build() {
    cd "$srcdir/liblogger-$pkgver"
    meson setup build --prefix=$pkgdir/usr --buildtype=release
    ninja -C build
}

package() {
    cd "$srcdir/liblogger-$pkgver"
    ninja -C build install
}
