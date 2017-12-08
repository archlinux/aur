# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli
_realver=1.2.1
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
sha256sums=('0fbc10571a07451891f00a6a4dd42522eec70f18e471ecd5a7c277a36cf7e5c0')

package() {
    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/Etcher-cli-${_realver}-linux-x64" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
