# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=8.1.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=7.96.0')
conflicts=('sfpi')
_upstreamver=${pkgver//_/-}
source=("https://github.com/tenstorrent/sfpi/releases/download/${_upstreamver}/sfpi_${_upstreamver}_x86_64_debian.txz")
b2sums=('f558c8ffd70df5b9e608c6fc1ec8e7ebd72fc5d30cc1fb65c4b703645ea22ef7c74b069156d1f82eb4ef42dafbd6e59d01f12691880fde10dc3ca8ade80d6734')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}
