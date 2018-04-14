# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-cmake-utils
pkgver=6.7.0
pkgrel=1
pkgdesc='Kurento cmake utilities'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('cmake')
makedepends=('cmake')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('adece455b4c2ae0d69305c6952323f64ee6efed7aa9f9703ed4df5fbf42ef6bf')

build() {
    mkdir -p "build"
    cd "build"

    cmake ${srcdir}/${pkgname}-${pkgver}/. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr
}
package() {
    make -C build DESTDIR="${pkgdir}" install
}
