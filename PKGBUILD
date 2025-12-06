# Maintainer: novica <nnovica@gmail.com>

pkgname=tinyetl-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Fast, zero-config ETL in a single binary"
arch=('x86_64')
url="https://github.com/alrpal/TinyETL"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl' 'unixodbc')
options=('!debug')
provides_x86_64=("TinyETL=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/alrpal/TinyETL/releases/download/v${pkgver}/tinyetl-linux-$CARCH.tar.gz"
                "https://raw.githubusercontent.com/alrpal/TinyETL/refs/tags/v${pkgver}/LICENSE")
sha256sums_x86_64=('518d5376a183db9d24e5961dee110895c5a5d32144f7de2053882c8528c42009'
                   '91d18da4d08bc2712c854a5d200b85cd6ee90351d898b221785a820646e02116')

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/tinyetl" "$pkgdir/usr/bin/tinyetl"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
