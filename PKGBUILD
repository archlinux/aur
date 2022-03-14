# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='ecos'
pkgver='2.0.10'
pkgrel=1
pkgdesc="A lightweight conic solver for second-order cone programming."
url="https://www.embotech.com/ECOS"
depends=('glibc')
makedepends=('cmake')
license=('GPL3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/embotech/ecos/archive/v${pkgver}.tar.gz")
sha256sums=('1aa24b5782b84fa33df2987510fb8f60f5f999cc2d3a5c73cfc3eb5e5f3b46af')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    make DESTDIR="${pkgdir}" -C build install
}
