# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.2.0
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
b2sums=('9ec22a29f4d73247affa3d4ae0ef697386f74f5aae80e067873468e83d33d7575f2758c8ac47b939251a175ea812b86f62d7ed93ed106809538518f3fdc504b9')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

