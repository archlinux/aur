# Maintainer: novica <nnovica@gmail.com>

pkgname=typr-bin
pkgver=0.5.6 # renovate: datasource=github-tags depName=we-data-ch/typr
pkgrel=1
pkgdesc="A modern type system for R"
arch=('x86_64')
url=https://github.com/we-data-ch/typr
license=('Apache-2.0')
depends=('glibc' 'libgcc')
conflicts=('typr')
options=('!debug')
provides_x86_64=("typr=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/we-data-ch/typr/releases/download/v${pkgver}/typr-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/we-data-ch/typr/refs/tags/v${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/typr" "$pkgdir/usr/bin/typr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('8fd76dabbc2ca548adad137970bccf37fd77916dd98f6137d589d199ecf4a40c'
                   'c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c')
