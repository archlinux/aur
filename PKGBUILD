# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.77.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=7.75.1')
conflicts=('sfpi')
_upstreamver=${pkgver//_/-}
source=("https://github.com/tenstorrent/sfpi/releases/download/${_upstreamver}/sfpi_${_upstreamver}_x86_64_debian.txz")
b2sums=('15eb9f4f8e726ef9e1a863b923ced2a16899f2020c50153d067f60f215f35493e39c210cb8cc33b4d7db41181a4dcfdc910e0566539f3f25035e4796adc28de5')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}
