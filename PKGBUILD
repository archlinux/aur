# Maintainer: Paolo Stivanin <info [at] paolostivanin [DOT] com>

pkgname=libbaseencode
pkgver=1.0.4
pkgrel=1
pkgdesc='Library written in C for encoding and decoding data using base32 or base64 (RFC-4648)'
arch=('i686' 'x86_64')
makedepends=('cmake')
url="https://github.com/paolostivanin/libbaseencode"
options=('!strip')
license=('GPL3')

source=("https://github.com/paolostivanin/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=("1ed0a3dd29a0ed70c7113f1b1b7d17f72c65454946a9fb915edf5050f8e0c65d")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir build && cd $_
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
