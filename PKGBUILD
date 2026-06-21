# Maintainer: novica <nnovica@gmail.com>

pkgname=typr-bin
pkgver=0.5.3
pkgrel=2
pkgdesc="A modern type system for R"
arch=('x86_64')
url=https://github.com/we-data-ch/typr
license=('Apache-2.0')
depends=('glibc' 'libgcc')
conflicts=('typr')
options=('!debug')
provides_x86_64=("typr=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/we-data-ch/typr/releases/download/v${pkgver}/typr-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/we-data-ch/typr/refs/tags/v${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/typr" "$pkgdir/usr/bin/typr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('28c6dc2caf6710ffd6a1236199c63e2cdaa50fc4203e68bbce3c884b9fd9e182'
                   'c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c')
