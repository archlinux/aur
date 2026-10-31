# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.93.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=7.92.0')
conflicts=('sfpi')
_upstreamver=${pkgver//_/-}
source=("https://github.com/tenstorrent/sfpi/releases/download/${_upstreamver}/sfpi_${_upstreamver}_x86_64_debian.txz")
b2sums=('197bccf39a75d292c4a7fddbb5b4d94950f7ff005dba0c0d9bb3da197f3c8df57437bdbcefb2c5552caba8b1462dc98f52d9e70d726b57e805c135561d6ddb78')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}
