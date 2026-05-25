# Maintainer: novica <nnovica@gmail.com>

pkgname=typr-bin
pkgver=0.4.28
pkgrel=2
pkgdesc="A modern type system for R"
arch=('x86_64')
url=https://github.com/we-data-ch/typr
license=('Apache-2.0')
depends=('glibc' 'libgcc')
conflicts=('typr')
options=('!debug')
provides_x86_64=("arf=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/we-data-ch/typr/releases/download/v${pkgver}/typr-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/we-data-ch/typr/refs/tags/v${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/typr" "$pkgdir/usr/bin/typr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('aa514b658af77821b33da726b8cb228bdd86713f9598f7f16bf572ee203fb051'
                   'c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c')
