# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=8.2.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=8.1.0')
conflicts=('sfpi')
_upstreamver=${pkgver//_/-}
source=("https://github.com/tenstorrent/sfpi/releases/download/${_upstreamver}/sfpi_${_upstreamver}_x86_64_debian.txz")
b2sums=('4021abc4454e5ea0fde76cdfe7adfe748057fce25fb309534aa6a2aa13faeeefad2efb0bd3aacf6ea02fa8a4c41a71157bdb70b47e5cbb8ce6da20c7f3965b1b')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}
