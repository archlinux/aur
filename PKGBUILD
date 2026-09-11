# Maintainer: novica <nnovica@gmail.com>

pkgname=typr-bin
pkgver=0.5.11 # renovate: datasource=github-tags depName=we-data-ch/typr
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

sha256sums_x86_64=('29373a28a87b81541da4d46d87bd44fb5bdc3b543fd48a46d86fc5f4f5a1b843'
                   'c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c')
