# Maintainer: Carmelo <carmelo at cock dot li>

pkgname=minergate
pkgver=8.3
pkgrel=1
pkgdesc='Cryptocurrency GUI miner and Mining Pool'
arch=('x86_64')
url='http://www.minergate.com/'
provides=('minergate')
license=('custom')
source=("minergate-${pkgver}.deb::https://minergate.com/download/ubuntu")
sha256sums=('91e6e9b24b1cae00ea9dadd6e9917613cb6f7884b8d587f43f0e8563ee7c0fef')
depends=('ocl-icd')
optdepends=('bfgminer'
            'cuda: If you have an Nvidia GPU')
install=${pkgname}.install
options=(!strip)

prepare() {
    bsdtar xf data.tar.gz
}

package() {
    rm -r opt/minergate/lib/libOpenCL.so*
    chmod -R g-w usr opt
    mv usr opt "${pkgdir}"
}
