# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-cmake-utils
pkgver=1.4.0
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
sha256sums=('13616dc4b760d9aea1031e3c2f638c44b029a18e5f7117e51cb29d0f6071a857')

build() {
    mkdir -p "build"
    cd "build"

    cmake ${srcdir}/${pkgname}-${pkgver}/. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr
}
package() {
    make -C build DESTDIR="${pkgdir}" install
}
