# Maintainer: Walwe <aur@walwe.de>
pkgname=jetbrains-resharper-commandlinetools
pkgver=2024.2.6
pkgrel=1
pkgdesc="JetBrains ReSharper Command Line Tools"
arch=('x86_64')
url="https://www.jetbrains.com/resharper"
license=('custom:jetbrains')
depends=('dotnet-sdk')
source=("https://download-cdn.jetbrains.com/resharper/dotUltimate.${pkgver}/JetBrains.ReSharper.CommandLineTools.${pkgver}.zip")
sha256sums=('b71d9d2c4793ef293107d1c01fdaa887179311a9a3b44c81e7f42328b1689447') 

package() {
    install -d "$pkgdir/opt/$pkgname"

    # Create wrapper scripts in /usr/bin
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/cleanupcode" <<EOF
#!/bin/bash
/opt/$pkgname/cleanupcode.sh "\$@"
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/inspectcode" <<EOF
#!/bin/bash
/opt/$pkgname/inspectcode.sh "\$@"
EOF

}

# vim:set ts=2 sw=2 et:
