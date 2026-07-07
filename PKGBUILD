# Maintainer: Jan Fidra <tkmxqrd@gmail.com>
pkgname=eclipselock
pkgver=2.3.5
pkgrel=1
pkgdesc="A command-line and GUI file encryption tool using AES-256-CBC with GTK interface"
arch=('x86_64')
url="https://github.com/tkmxqrdxddd/EclipseLock"
license=('MIT')
depends=('openssl' 'gtkmm3' 'gtk3')
makedepends=('cmake' 'gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tkmxqrdxddd/EclipseLock/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "EclipseLock-$pkgver"
    mkdir -p build && cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "EclipseLock-$pkgver/build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
