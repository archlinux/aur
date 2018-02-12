# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=spice-up
_pkgname=Spice-up
pkgver=1.3.0
pkgrel=1
pkgdesc="Create simple and beautiful presentations on the Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Spice-up"
license=('GPL3')
depends=('granite' 'libgee' 'gtk3' 'json-glib' 'libgudev' 'libevdev')
makedepends=('cmake' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Philip-Scott/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('61351f2ebf8187935752fbf10c2c06c290de69df0d05c874a9388edfb03f54552a4951c88eed63f69c085963d8911b210e2e97c1b33b0333d044a415db1b69f2')

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
