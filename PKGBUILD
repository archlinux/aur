# Maintainer: qqlsdev salvadorqqls@gmail.com

pkgname=lpbooster
pkgver=1.0.1
pkgrel=1
pkgdesc="Linux System Optimizer: Cleaning Packages and Disabling Background Services"
arch=('x86_64')
url="https://github.com/qqlsdev/lpbooster"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qqlsdev/lpbooster/archive/refs/tags/lpb.tar.gz")

sha256sums=('8bcd076f4a28fdb221bfb56161d15ecbfe07519086969cb200b6b714a7b52b4b')

build() {
    # Папка внутри архива теперь называется lpbooster-lpb
    cd "${srcdir}/${pkgname}-lpb"
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-lpb"
    DESTDIR="${pkgdir}" cmake --install build
}
