# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli-bin
_realver=1.4.5
pkgver=${_realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('x86_64')
url="http://www.etcher.io/"
license=('apache')
provides=('etcher-cli')
conflicts=('etcher-cli')
depends=('gcc-libs')
optdepends=()
source=("https://github.com/resin-io/etcher/releases/download/v${_realver}/Etcher-cli-${_realver}-linux-x64.tar.gz")
options=("!strip")
sha256sums=('f7f3d63c29f5bf0b494c68efd6cc990e2e571c5f1833ed1c6f773f0f3681eb56')

package() {
    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/etcher-cli-${_realver}-linux-x64-dist" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
