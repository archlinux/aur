# Maintainer: JustKidding <jk@vin.ovh>

pkgname=minergate-cli
pkgver=1.7
pkgrel=2
pkgdesc="MinerGate xFast CLI Miner"
arch=("x86_64")
url="http://www.minergate.com/"
provides=("minergate-cli")
license=("custom")
source=("${pkgname}-${pkgver}.deb::https://vin.ovh/MinerGate-xFast-cli-1.7-ubuntu.deb")
sha256sums=("bff127436b13a455c2022052d67156313163f53a1ee1835c0756d39adf591a77")
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
