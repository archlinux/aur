# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=sfpi-bin
pkgver=7.28.0
pkgrel=1
pkgdesc="Tenstorrent SFPU programming interface"
arch=('x86_64')
url="https://github.com/tenstorrent/sfpi"
license=('Apache-2.0' 'GPLv2')
depends=('glibc')
makedepends=('tar' 'xz')
provides=('sfpi=7.27.0')
conflicts=('sfpi')
source=("https://github.com/tenstorrent/sfpi/releases/download/${pkgver}/sfpi_${pkgver}_x86_64_fedora.txz")
b2sums=('2a737fc947ee3966c2f339498822c6c6fddcc4f7a4b4a66169aa3101ce25246c54e59e24656e8290ff899ddb49f1b1bbe8e3c956784521f58455bdd54212bc91')
options=('!strip')

package() {
    cd "$srcdir"/sfpi
    mkdir -p "$pkgdir/opt/tenstorrent/sfpi"
    cp -r compiler "$pkgdir/opt/tenstorrent/sfpi/compiler"
    cp -r include "$pkgdir/opt/tenstorrent/sfpi/include"
}

