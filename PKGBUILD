# Maintainer: novica <nnovica@gmail.com>

pkgname=tinyetl-bin
pkgver=0.12.1 # renovate: datasource=github-releases depName=alrpal/TinyETL
pkgrel=1
pkgdesc="Fast, zero-config ETL in a single binary"
arch=('x86_64')
url="https://github.com/alrpal/TinyETL"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl' 'unixodbc')
conflicts=('tinyetl')
options=('!debug')
provides_x86_64=("tinyetl=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/alrpal/TinyETL/releases/download/v${pkgver}/tinyetl-linux-x86_64.tar.gz"
                "https://raw.githubusercontent.com/alrpal/TinyETL/refs/tags/v${pkgver}/LICENSE")
sha256sums_x86_64=('3ac5702ad0aaa3319987594cfa15f2fe8e7b6956d3fbe1dc9ca3fcb463693cb5'
                   '3c14c6403d4565757f7ee93cec91d8895d82cac5a9bf1cb44abd343e4c639886')

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/tinyetl" "$pkgdir/usr/bin/tinyetl"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
