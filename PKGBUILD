# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli
_realver=1.2.0
pkgver=${_realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('x86_64')
url="http://www.etcher.io/"
license=('apache')
depends=('gcc-libs')
optdepends=()
source=("https://github.com/resin-io/etcher/releases/download/v${_realver}/Etcher-cli-${_realver}-linux-x64.tar.gz")
options=("!strip")
sha256sums=('503ada5008396c4c4ba45b75ddf67658031ef57d4cdd573aa2543fcd7e9be96f')

package() {
    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/Etcher-cli-${_realver}-linux-x64" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
