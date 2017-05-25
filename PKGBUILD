# Maintainer: Paolo Stivanin <info A,T paolostivanin D,O,T com>

pkgname=libcotp
pkgver=1.0.7
pkgrel=1
pkgdesc='C library that generates TOTP and HOTP'
arch=('i686' 'x86_64')
depends=('libbaseencode')
makedepends=('cmake')
url="https://github.com/paolostivanin/libcotp"
options=('!strip')
license=('GPL3')

source=("https://github.com/paolostivanin/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=("1ceb7c970adf5408c2edee2bb1b8ea8ce00b77f66c0fb0327eaa933ce55943e3")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir build && cd $_
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    make cotp
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
