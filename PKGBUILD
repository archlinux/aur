# Maintainer: Shin Morisawa <me@tryh4rd.dev>
pkgname=liblogger
pkgver=0.0.2
pkgrel=1
pkgdesc="a simple, elegent log library in C"
arch=('x86_64')
url="https://github.com/shinmorisawa/liblogger"
license=('MIT')
depends=()
makedepends=('pkgconf' 'meson' 'ninja' 'gcc')
source=("https://files.tryh4rd.dev/liblogger-releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0e413a654debb0afa08539668bd8549d06702a55bb50c5a3c4a2a4eba9d02ae7')

build() {
    cd "$srcdir/liblogger-$pkgver"
    meson setup build --prefix=$pkgdir/usr --buildtype=release
    ninja -C build
}

package() {
    cd "$srcdir/liblogger-$pkgver"
    ninja -C build install
}