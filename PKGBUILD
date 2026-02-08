# Maintainer: Tanmay Chaudhry <tanmay.chaudhry@gmail.com>
pkgname=envyr-bin
pkgver=0.4.1
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
sha256sums_x86_64=('21acfb5c41f6c5d8e54b3fbbc79637e0dee90265af4124ed1b891fff3c49e7d2')
sha256sums_aarch64=('2dfc1933eb15ecdecd8f67aa2060953cdf6690956441e0c5871b5aa531594c91')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "envyr-x86_64-linux" "$pkgdir/usr/bin/envyr"
    else
        install -Dm755 "envyr-aarch64-linux" "$pkgdir/usr/bin/envyr"
    fi
}
