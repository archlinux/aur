# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=spice-up
_pkgname=Spice-up
pkgver=1.8.0
pkgrel=1
pkgdesc="Create simple and beautiful presentations on the Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Spice-up"
license=('GPL3')
depends=('granite' 'libgee' 'gtk3' 'json-glib' 'libgudev' 'libevdev' 'libsoup')
makedepends=('cmake' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Philip-Scott/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f092156d1226a0c1fd65e72fe8c8192ef6c0b7c9e8f829d862c03b786e1fe347d43955892510ed40532699a4a0111eef2bec07d1bf52fa330dd42a7fb0999e6d')

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
