# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=spice-up
_pkgname=Spice-up
pkgver=1.0.0
pkgrel=1
pkgdesc="Create simple and beautiful presentations on the Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Spice-up"
license=('GPL3')
depends=('granite' 'libgee' 'gtk3' 'json-glib' 'libgudev' 'libevdev')
makedepends=('cmake' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Philip-Scott/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('35b69ff074d65d5ba86a3e447738ab04a5a8a00a621c3bb07a4c77ca92d435aab7f4d6ec08fdda8d96f9cd550f2eac6c7003858a2da3c6e774c0e2be9da10d24')

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
