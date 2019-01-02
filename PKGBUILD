# Maintainer: SantoZ <santoz28 at mailbox dot org>

pkgname=minergate
pkgver=1.2
pkgrel=1
pkgdesc="Cryptocurrency GUI miner and Mining Pool (xFast)"
arch=("x86_64")
url="http://www.minergate.com/"
provides=("minergate")
license=("custom")
source=("MinerGatexFast-${pkgver}-amd64.deb::https://minergate.com/download/xfast-ubuntu-gui")
sha256sums=("ced988d6cb6b6543860ef05779f8f71891aab98b6c62c131e69737e852b2b462")
depends=("ocl-icd")
optdepends=("bfgminer"
            "cuda: If you have an Nvidia GPU")
install=${pkgname}.install
options=(!strip)

prepare() {
    tar xf "${srcdir}/data.tar.gz"
}

package() {
    rm -r opt/minergate/lib/libOpenCL.so*
    chmod -R g-w usr opt
    mv usr opt "${pkgdir}"
}
