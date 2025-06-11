# Maintainer: Swarnava Ghosh <swarnavaghosh04@gmail.com>
pkgname=gr-satlab
pkgver=20250319
pkgrel=1
pkgdesc="contains GNURadio blocks for Satlab SRS-3 and SRS-4 radios"
arch=('x86_64')
url="https://www.satlab.com/products/srs-4/"
license=('GPL-3.0-or-later')
depends=('gnuradio' 'openssl')
makedepends=('cmake')
source=("https://resources.satlab.com/software/gr-satlab/${pkgname}-v${pkgver}.tar.xz")
sha256sums=('e76efdb2114d27e5102824d303e051b0fe361812b4b68cb5e7544b4ca834ff1a')

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
