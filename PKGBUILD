# Maintainer: JustKidding <jk@vin.ovh>

pkgname=minergate-gui
pkgver=1.7
pkgrel=3
pkgdesc="Minergate xFast GUI Miner"
arch=("x86_64")
url="http://www.minergate.com/"
provides=("minergate-gui")
license=("custom")
source=("https://vin.ovh/MinerGate-xFast-gui-${pkgver}-ubuntu.deb")
sha256sums=("1b24f3785a68043092366a9195524becbe8c589257b365628a0cb271d75e465f")
options=(!strip)
depends=('ocl-icd' 'qt5-websockets' 'icu')


prepare() {
    mkdir minergate-data
    tar xf data.tar.gz -C minergate-data
}

package() {
    cd ${srcdir}/minergate-data
    chmod -R g-w usr opt
    mv usr opt "${pkgdir}"
}
