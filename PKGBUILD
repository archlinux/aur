# Maintainer: VinJK <vinjk at disroot dot org>

pkgname=minergate-nvidia
pkgver=1.4
pkgrel=1
pkgdesc="Cryptocurrency GUI miner and Mining Pool (xFast)"
arch=("x86_64")
url="http://www.minergate.com/"
provides=("minergate")
license=("custom")
source=("MinerGate-xFast-gui-${pkgver}-ubuntu.deb::https://minergate.com/download/xfast-ubuntu-gui")
sha256sums=("09c518d356a7a09791a016fd9f0ad4be4e5b2fc253cb448dbba0b797331ae2af")
depends=("ocl-icd"
         "qt5-websockets"
         "cuda-9.1"
         "desktop-file-utils")
options=(!strip)
replaces=("minergate")
provides=("minergate")
conflicts=("minergate-amd")

prepare() {
    tar xf "${srcdir}/data.tar.gz"
}

package() {
    chmod -R g-w usr opt
    mv usr opt "${pkgdir}"
}
