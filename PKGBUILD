# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qtextpad
pkgdesc="Lightweight cross-platform text editor using KF5's syntax highlighting repository."
pkgver=1.3
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/zrax/qtextpad'
license=('GPL3')
depends=('syntax-highlighting')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('496bf38fcaceadb4a059b3fdc9e4d1f1435d91c7a7d66d6dda1b9ca55a9322ef')

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
