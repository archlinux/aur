# Maintainer: Swarnava Ghosh <swarnavaghosh04@gmail.com>
pkgname=gr-satlab
pkgver=20250722
pkgrel=1
pkgdesc="contains GNURadio blocks for Satlab SRS-3 and SRS-4 radios"
arch=('x86_64')
url="https://www.satlab.com/products/srs-4/"
license=('GPL-3.0-or-later')
depends=('gnuradio' 'openssl')
makedepends=('cmake')
source=("https://resources.satlab.com/software/gr-satlab/${pkgname}-v${pkgver}.tar.xz")
sha256sums=('14aac1a0772be800ed4df3023f50d286712562be5e27ba8f05f89354fa60f4f3')

build() {
    cd "${pkgname}-v${pkgver}"
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr # for ubuntu, don't include `-DCMAKE_INSTALL_PREFIX=/usr`
    make
}

package() {
    cd "${pkgname}-v${pkgver}/build"
    make install DESTDIR="${pkgdir}"
}
