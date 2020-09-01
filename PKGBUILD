# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qtextpad
pkgdesc="Lightweight cross-platform text editor using KF5's syntax highlighting repository."
pkgver=1.5
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/zrax/qtextpad'
license=('GPL3')
depends=('syntax-highlighting')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cca2cb046a8e92fa1c9591ea361b06d09b2da52133f32a8e09e1a39f6588eeb0')

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
