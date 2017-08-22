# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli
_realver=1.1.2
pkgver=${_realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('i686' 'x86_64')
url="http://www.etcher.io/"
license=('apache')
depends=('gcc-libs')
optdepends=()
source_i686=("https://github.com/resin-io/etcher/releases/download/v${_realver}/Etcher-cli-${_realver}-linux-x86.tar.gz")
source_x86_64=("https://github.com/resin-io/etcher/releases/download/v${_realver}/Etcher-cli-${_realver}-linux-x64.tar.gz")
options=("!strip")
sha256sums_i686=('e93de0084c3536ed0d0b49b4f8aaaaf9c8fc73b3a276345b4ed4a0bfe46833da')
sha256sums_x86_64=('0d9969978cdf2417b2082eacd5ad06873b5a4e67f55ecfbcdd887f012bf2e6db')

package() {
    local a
    case "$pkgarch" in
      i686) a=x86 ;;
      x86_64) a=x64 ;;
    esac

    cd "$pkgdir"
    mkdir opt
    mv "$srcdir/Etcher-cli-${_realver}-linux-$a" opt/etcher-cli

    mkdir -p usr/bin
    ln -s /opt/etcher-cli/etcher usr/bin/etcher
}
