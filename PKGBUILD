# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.4.0
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
b2sums=('ab6c8e8623bdbbe5a23cdb2d30adbaf9745892e3514d4217241e021d20ce313fd39f4578efa08152b6d1bb0b494d7ae628aaa0961884468342d8d971936d8789')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

