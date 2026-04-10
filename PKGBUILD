# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.39.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=7.37.0')
conflicts=('sfpi')
source=("https://github.com/tenstorrent/sfpi/releases/download/${pkgver}/sfpi_${pkgver}_x86_64_fedora.txz")
b2sums=('1903819a8b1b33b7923da7a07c678e28122d4d6645fd20fe0ffc30bd41e4fff3b382fd4ca9fa3e93d9ab35587dd4c06a7a1ba73202f629b6b19c771da7c78407')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

