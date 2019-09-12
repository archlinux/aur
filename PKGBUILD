# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: btd1337

pkgname=spice-up
_pkgname=Spice-up
pkgver=1.8.2
pkgrel=1
pkgdesc="Create simple and beautiful presentations on the Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Spice-up"
license=('GPL3')
depends=('granite' 'libgee' 'gtk3' 'json-glib' 'libgudev' 'libevdev' 'libsoup')
makedepends=('cmake' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Philip-Scott/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('67783d7fb8f7a4756f4312e8a43d4d9c9d60524956dd3de9076506a2da513c17')

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
