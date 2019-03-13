# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli
_realver=1.4.9
pkgver=${_realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('x86_64')
url="http://www.etcher.io/"
license=('apache')
depends=('gcc-libs')
optdepends=()
source=("https://github.com/resin-io/etcher/releases/download/v${_realver}/balena-etcher-cli-${_realver}-linux-x64.tar.gz")
options=("!strip")
sha256sums=('67d1173fdf7c4c528f4027147463597cffdef9d50ddcf0c74c9651685b1c451e')

package() {
    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/balena-etcher-cli-${_realver}-linux-x64-dist" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
