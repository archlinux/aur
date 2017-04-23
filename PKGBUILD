# Maintainer: Paolo Stivanin <info A,T paolostivanin D,O,T com>

pkgname=libbaseencode
pkgver=1.0.1
pkgrel=1
pkgdesc='C library that generates TOTP and HOTP'
arch=('i686' 'x86_64')
makedepends=('cmake')
url="https://github.com/paolostivanin/libbaseencode"
options=('!strip')
license=('GPL3')

source=("https://github.com/paolostivanin/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=("82202c73ed11f7957712d9bca0dd694431ddc999909b15e81c54fda40af6a5e7")

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
