# Maintainer: demfabris <demfabris at gmail dot com>
pkgname=gistit-bin
_bin="gistit"
_daemon="gistit-daemon"
pkgver=0.2.3
pkgrel=1
pkgdesc="Quick and easy code snippet sharing with p2p support"
arch=("x86_64")
url="https://github.com/demfabris/gistit"
license=("Apache")
provides=("gistit-bin")
conflicts=("gistit-bin" "gistit-git")
source=(
  "gistit.tar.gz::https://github.com/demfabris/gistit/releases/download/v${pkgver}/${_bin}-musl-${CARCH}.tar.gz"
  "gistit-daemon.tar.gz::https://github.com/demfabris/gistit/releases/download/v${pkgver}/${_daemon}-musl-${CARCH}.tar.gz"
)

sha256sums=('3a5b96fda88d0341ec754e87b1bd3c4d709055f100cc5726e9ae4e26a82bcfa9'
            '8899df45cca8f97bfa04143216cad98634b8f29eabaa5b241ab5300fa5c30f69')

package(){
  install -Dm755 ${srcdir}/target/x86_64-unknown-linux-musl/release/${_bin} "${pkgdir}/usr/bin/${_bin}"
  install -Dm755 ${srcdir}/target/x86_64-unknown-linux-musl/release/${_daemon} "${pkgdir}/usr/bin/${_daemon}"
}

