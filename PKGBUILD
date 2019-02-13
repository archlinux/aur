# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=interception-space2meta
pkgver=0.1.0
pkgrel=1
pkgdesc='space2meta: turn space into meta when chorded to another key (on release)'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/space2meta'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/plugins/space2meta/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('a1b9c7417ff543f48e8eea6b5b8e42a75d3632d32c285f0cd2d7d55dbad4a0b3')

build() {
    cd ${srcdir}/space2meta-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/space2meta-v${pkgver}-*/build

    make DESTDIR="$pkgdir/" install
}
