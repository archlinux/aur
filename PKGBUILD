# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=6.21.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi')
conflicts=('sfpi')
source=("https://github.com/tenstorrent/sfpi/releases/download/v${pkgver}/sfpi_${pkgver}_x86_64.txz")
b2sums=('80a32b0b969c442178797f67e6e4917d8d6cb6857acabaa41e1641f13d16188a259807f482a5119d2ed26ee258f8ca16f4861edd5ae36fe997230be9469f712c')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

