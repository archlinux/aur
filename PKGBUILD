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

sha256sums=('60ff02f9c3544c0a092830a1e345aebdc198fcf89ea0febb67bfe6ac6b5adf8a')

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
