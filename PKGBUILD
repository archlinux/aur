# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli-bin
_realver=1.4.3
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
sha256sums=('ec98f83b0085ff2a94d4b02fadc5a42ac320e6b37489d97d8b73f84d291bfd0b')

package() {
    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/etcher-cli-${_realver}-linux-x64-dist" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
