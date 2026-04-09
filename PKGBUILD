# Maintainer: Michel Dusseault <mike dot dusseault at gmail dot com>
pkgname=qmentat
pkgver=1.1.0
pkgrel=1
pkgdesc="Mental arithmetic practice application"
arch=('x86_64')
url="https://github.com/RealGrep/QMentat"
license=('GPL3')
depends=('qt6-base' 'gmp')
makedepends=('qt6-tools')
source=('git+https://github.com/RealGrep/QMentat.git#tag=v1.1.0')
sha256sums=('SKIP')

build() {
    cmake -B build -S QMentat \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
