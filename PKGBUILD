# Maintainer: BBaoVanC <bbaovanc@bbaovanc.com>
pkgname=checkra1n-gui
pkgver=0.12.4
pkgrel=2
pkgdesc="checkra1n is a semi-tethered jailbreak based on the checkm8 bootrom exploit. (GUI version)"
license=('unknown')
url="https://checkra.in"
arch=('x86_64')
depends=(libimobiledevice libirecovery libtvcontrol ncurses5-compat-libs gtk3)
makedepends=(binutils tar)
_debname="checkra1n_${pkgver}_amd64.deb"
source=("https://assets.checkra.in/debian/${_debname}")
sha256sums=('90d3a5fb16e86c488344cfa8cec96e4592aa4d7f8932da99d4b5a052fdb10a1a')

options=(!strip) # for some reason, checkra1n segfaults if the binary is stripped

package() {
    ar x ${_debname}
    tar -xvf data.tar.xz
    mkdir -p ${pkgdir}/usr/bin
    install -m 0755 usr/bin/checkra1n ${pkgdir}/usr/bin/checkra1n-gui
}
