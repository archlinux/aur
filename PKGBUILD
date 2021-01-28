# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-space2meta
pkgver=0.1.1
pkgrel=1
pkgdesc='space2meta: turn space into meta when chorded to another key (on release)'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/space2meta'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/plugins/space2meta/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('dfd519f1db89a512c0aaba9f92723ddb23ca104764e3e64a771cc33f8dab5a63')

build() {
    cd ${srcdir}/space2meta-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/space2meta-v${pkgver}-*/build

    make DESTDIR="$pkgdir/" install
}
