# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli-bin
_realver=1.4.6
pkgver=${_realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('x86_64')
url="http://www.etcher.io/"
license=('apache')
provides=('etcher-cli')
conflicts=('etcher-cli' 'etcher-cli-git')
depends=('gcc-libs')
optdepends=()
source=("https://github.com/balena-io/etcher/releases/download/v${_realver}/Etcher-cli-${_realver}-linux-x64.tar.gz")
options=("!strip")
sha256sums=('f17b746ba6194e4f0e734fbf44baa5fe27e490d572836fc87c2e93b3db4d505f')

package() {
    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/etcher-cli-${_realver}-linux-x64-dist" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
