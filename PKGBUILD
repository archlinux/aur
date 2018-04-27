# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli-bin
_realver=1.4.4
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
sha256sums=('54709ad34ac304d2686130c7d22a3bc13b4f491387d987274eeca4f6eea34dce')

package() {
    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/etcher-cli-${_realver}-linux-x64-dist" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
