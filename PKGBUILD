# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.25.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=7.24.0')
conflicts=('sfpi')
source=("https://github.com/tenstorrent/sfpi/releases/download/${pkgver}/sfpi_${pkgver}_x86_64_fedora.txz")
b2sums=('cadc4547926c867d5bd2c6b801117a2e1203108b8ff1a0e833ced874123ac1c6fdd7dc06e5115e0866ba02747a053b83ab3f4287a26b4794a5a3eba7f8b44f59')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

