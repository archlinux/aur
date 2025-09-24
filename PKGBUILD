# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.1.0
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
b2sums=('6a6622a14324d8559eed7736e122956b622e5399eb37b1cd6fe5a88f8c578f853129677078de0f3997d6b51db97f151ebc78668df9baf67f031d439d0ae1fc49')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

