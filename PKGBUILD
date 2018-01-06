# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli
_realver=1.3.0
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
sha256sums=('38588b723456ba1825af96da6cc503f39654ff7b87612ca8bc45d5e50b16d61a')

package() {
    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/Etcher-cli-${_realver}-linux-x64" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
