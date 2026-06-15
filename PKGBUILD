# Maintainer: qqlsdev salvadorqqls@gmail.com

pkgname=lpbooster
pkgver=1.6.8
pkgrel=1
pkgdesc="Linux System Optimizer: Cleaning Packages and Disabling Background Services"
arch=('x86_64')
url="https://github.com/qqlsdev/lpbooster"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qqlsdev/lpbooster/archive/refs/tags/lpb1.6.8.tar.gz")

sha256sums=('aaf45cce53fc7dabe1e2f99e3ae8a4bd008be99c3e44ee061e9d70798df1d5c5')

build() {
    # Папка внутри архива теперь называется lpbooster-lpb
    cd "${srcdir}/${pkgname}-lpb1.6.8"
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-lpb1.6.8"
    DESTDIR="${pkgdir}" cmake --install build
}
