# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.27.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=7.26.0')
conflicts=('sfpi')
source=("https://github.com/tenstorrent/sfpi/releases/download/${pkgver}/sfpi_${pkgver}_x86_64_fedora.txz")
b2sums=('636c2f89ea5c28c90cc14885a96dcfd1e22bafd76cb19352adde059f4afbeff2e47dd2cd9fa98a88a03a8f4825499dc37dc5bad70df27d8025e4122692720e75')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

