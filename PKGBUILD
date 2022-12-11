# Maintainer: Paolo Stivanin <info at paolostivanin dot com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>

pkgname=libbaseencode
pkgver=1.0.14
pkgrel=1
pkgdesc='C library for encoding/decoding base32 and base64 data (RFC-4648)'
url="https://github.com/paolostivanin/libbaseencode"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('cmake')
validpgpkeys=('060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('bc95a64507b4ac359eec1f858a6bdcf84c9562424d40fbea8ab00021e9b3197c'
            'SKIP')

build()  {
    cd "$pkgname-$pkgver"
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build . --target all
}

package() {
    cd "$pkgname-$pkgver/build"
    cmake --install . --prefix="$pkgdir/usr"
}
