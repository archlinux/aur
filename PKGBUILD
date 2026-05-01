# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.45.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=7.44.0')
conflicts=('sfpi')
source=("https://github.com/tenstorrent/sfpi/releases/download/${pkgver}/sfpi_${pkgver}_x86_64_fedora.txz")
b2sums=('872a0ff5162823d07f8fa2510780982069077c0ea26f9df3b0bd54451fe4e756da302b65acb36b02d11bedf225990be9cb0ced7e11faf4421c6e8919a8213233')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

