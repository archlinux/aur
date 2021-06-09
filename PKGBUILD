# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='ecos'
pkgver='2.0.8'
pkgrel=1
pkgdesc="A lightweight conic solver for second-order cone programming."
url="https://www.embotech.com/ECOS"
depends=('glibc')
makedepends=('cmake')
license=('GPL3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/embotech/ecos/archive/v${pkgver}.tar.gz")
sha256sums=('d905d16599efd927a75b29852c3476ff1ffd0b97ab27d5b8ad63bb4ff2ad8130')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    make DESTDIR="${pkgdir}" -C build install
}
