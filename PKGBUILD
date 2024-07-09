# Maintainer: Maxim De Clercq <maximdeclercq00@gmail.com>

pkgname=cmsis-toolbox
pkgver=2.4.0
pkgrel=1
pkgdesc="CMSIS Toolbox for ARM Cortex-M software development"
arch=('x86_64')
url="https://github.com/Open-CMSIS-Pack/cmsis-toolbox"
license=('Apache')
source=("cmsis-toolbox-linux-amd64.tar.gz::https://github.com/Open-CMSIS-Pack/cmsis-toolbox/releases/download/$pkgver/cmsis-toolbox-linux-amd64.tar.gz")
sha256sums=('5d3ee2037c0b729e4834c5bc368dac11d14fd9fc530055dd6335da345be5633e')

package() {
    cd "$srcdir/cmsis-toolbox-linux-amd64"

    # Install binaries
    install -Dm755 bin/* "$pkgdir/usr/bin/"

    # Install configuration files
    install -Dm644 etc/* -t "$pkgdir/etc/cmsis-toolbox/"

    # Install license
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
