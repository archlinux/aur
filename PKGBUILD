# Maintainer: Louise <louise dot aur at mailbox dot org>

pkgname=lyra
pkgver=1.8.0
pkgdesc="A simple to use, composable, command line parser for C++ 11 and beyond"
pkgrel=1
arch=('any')
license=('BSL-1.0')
source=("https://github.com/bfgroup/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('5bc1dbb4aa460fbf4c70aaf6688593233ac7763e2852f4bef333d2fdfe4a4faa17c7be0217b40900c69659cb8a7ee6c2506a0c06a62aaad3c470eb157e8821e4')
makedepends=('cmake')

build() {
    cd Lyra-${pkgver}
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd Lyra-${pkgver}
    make DESTDIR="${pkgdir}" install
}
