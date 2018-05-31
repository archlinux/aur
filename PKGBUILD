# Maintainer: Evrea <evrea at cock dot li>

pkgname=minergate-cli
pkgver=8.2
pkgrel=1
pkgdesc="Cryptocurrency miner and Mining Pool (console version)"
arch=("x86_64")
url="http://www.minergate.com/"
provides=("minergate-cli")
license=("custom")
source=("${pkgname}-${pkgver}-amd64.deb::https://minergate.com/download/ubuntu-cli")
sha256sums=("393c5ba236f6f92c449496fcda9509f4bfd3887422df98ffa59b3072124a99d8")
options=(!strip) # Doesn't work without disabling this option
depends=() # Minergate comes bundled with its own libraries

prepare() {
    # All is done in ${srcdir}
    mkdir minergate-data
    tar xf data.tar.gz -C minergate-data
}

package() {
    cd ${srcdir}/minergate-data
    chmod -R g-w usr opt
    mv usr opt "${pkgdir}"
}
