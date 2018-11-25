# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli-bin
_realver=1.4.8
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
source=("https://github.com/balena-io/etcher/releases/download/v${_realver}/balena-etcher-cli-${_realver}-linux-x64.tar.gz")
options=("!strip")
sha256sums=('9befa06b68bb5846bcf5a9516785d48d6aaa9364d80a5802deb5b6a968bf5404')

package() {
    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/balena-etcher-cli-${_realver}-linux-x64-dist" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
