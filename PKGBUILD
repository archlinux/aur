# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=gnoga
pkgver=1.5a
pkgrel=4
pkgdesc="Ada native GUI framework similar to the Electron framework"
arch=('x86_64')
url="http://www.gnoga.com/"
license=('GPL3')
depends=('libgpr')
makedepends=('gcc-ada' 'gprbuild' 'libgpr')
provides=('gnoga')
source=("https://downloads.sourceforge.net/project/gnoga/gnoga-${pkgver}.zip")
sha256sums=('0b7d119b7d0c30e5889b5aaf90a0aa1bf1d0e9ecc8cfcb8738fd6c8df3e497fd')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make -j1 BUILD_MODE=Release all
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make -j1 PREFIX="${pkgdir}/usr" BUILD_MODE=Release install
    cp "${srcdir}/${pkgname}-${pkgver}/settings.gpr" "${pkgdir}/usr/share/gpr/settings.gpr"
}
