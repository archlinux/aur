# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.3.0
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
b2sums=('5f7d9878bfe0ad85e632311a45a8385a3f884eb1cb8b4543cf5b64fc4e064cc5cbfd8c0f4e31c94df628584c564971608c1f2a968e28c72f244d9f2792312a82')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

