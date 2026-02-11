# Maintainer: Tanmay Chaudhry <tanmay.chaudhry@gmail.com>
pkgname=envyr-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Automagically package and run applications in sandboxed environments"
arch=('x86_64' 'aarch64')
url="https://github.com/tchaudhry91/envyr"
license=('Apache-2.0')
depends=('git')
optdepends=('docker: for Docker executor' 'podman: for Docker executor (alternative)')
provides=('envyr')
conflicts=('envyr')

source_x86_64=("${url}/releases/download/v${pkgver}/envyr-x86_64-linux.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/envyr-aarch64-linux.tar.gz")
sha256sums_x86_64=('212d27bbf7c8aa332cd2ddfd8dfaee36a2bd80e1d3d3bf622b41e77e958be9b0')
sha256sums_aarch64=('5fa39307864057196b00c13f27a50733b1d23c7955baba83f519b365b37c5ba2')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "envyr-x86_64-linux" "$pkgdir/usr/bin/envyr"
    else
        install -Dm755 "envyr-aarch64-linux" "$pkgdir/usr/bin/envyr"
    fi
}
