# Maintainer: qqlsdev salvadorqqls@gmail.com

pkgname=lpbooster
pkgver=1.1.0
pkgrel=1
pkgdesc="Linux System Optimizer: Cleaning Packages and Disabling Background Services"
arch=('x86_64')
url="https://github.com/qqlsdev/lpbooster"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qqlsdev/lpbooster/archive/refs/tags/lpb1.1.0.tar.gz")

sha256sums=('39f09e59097a1bdd29e76b3dc12a540a9e13196b5fc485904209351c2ebd063d')

build() {
    # Папка внутри архива теперь называется lpbooster-lpb
    cd "${srcdir}/${pkgname}-lpb1.1.0"
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-lpb1.1.0"
    DESTDIR="${pkgdir}" cmake --install build
}
