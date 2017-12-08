# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=spice-up
_pkgname=Spice-up
pkgver=1.1.0
pkgrel=1
pkgdesc="Create simple and beautiful presentations on the Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Spice-up"
license=('GPL3')
depends=('granite' 'libgee' 'gtk3' 'json-glib' 'libgudev' 'libevdev')
makedepends=('cmake' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Philip-Scott/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ed96b00985fd31197e4bc137a5de8c67db886c8999205f512c226b8262e1e6ff80ce2c0925f48b5ae805e9fc6fb99109850b8ad362af1b7533b1f5aa274af9a3')

build() {
    cd "${_pkgname}-${pkgver}"
    mkdir build -p
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    make -C "${_pkgname}-${pkgver}/build" DESTDIR="${pkgdir}" install
    ln -s "/usr/bin/com.github.philip-scott.spice-up" "${pkgdir}/usr/bin/spice-up"
}
