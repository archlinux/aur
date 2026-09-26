# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.83.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=7.81.0')
conflicts=('sfpi')
_upstreamver=${pkgver//_/-}
source=("https://github.com/tenstorrent/sfpi/releases/download/${_upstreamver}/sfpi_${_upstreamver}_x86_64_debian.txz")
b2sums=('61000ca8d88c0c4f2e6e0603014ca9ef07b419a7bc3810f7b8e926de013bc2f5dc723a8d2b9002e3eeee1bb1161c7b95c3883b7117d36ff434ba5a9ea96bf1a9')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}
