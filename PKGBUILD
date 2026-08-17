# Maintainer: Relish0171 <aur.such581@aleeas.com>
_basename=untwine
pkgname=${_basename,,}
pkgver=1.5.1
pkgrel=1
pkgdesc="Tool for creating Cloud Optimized Point Cloud (COPC) web services from PDAL-readable point cloud data sources."
arch=('x86_64' 'aarch64')
url="https://github.com/hobuinc/untwine"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'pdal')
makedepends=('cmake')
source=("${_basename}-${pkgver}.tar.gz::https://github.com/hobuinc/untwine/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('69b5ef26a28c514b1a8459440f32faccc4fb2d3b835aa9733bf4d8c31a5f7022')

build() {
    cd "${srcdir}/${_basename}-${pkgver}"

    cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None
    make
}

package() {
    cd "${srcdir}/${_basename}-${pkgver}"

    export DESTDIR="${pkgdir}"

    make install
}
