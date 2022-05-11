# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
pkgname=trex-bin
provides=('trex')
conflicts=('trex')
pkgver=0.26.1
pkgrel=1
pkgdesc="Cryptocurrency miner for NVIDIA hardware, supporting a variety of algorithms"
arch=('x86_64')
license=('custom')
url="https://bitcointalk.org/index.php?topic=4432704.0"
options=('!strip')
depends=('nvidia-utils')
source=("t-rex_${pkgver}.tar.gz"::"https://trex-miner.com/download/t-rex-${pkgver}-linux.tar.gz"
    "trex-bin.install")
sha256sums=('96c92ac2cc01fa7587308f9d72970f57f4be5733e9d7f76d0aec21f6f84bc65d'
    'bc050752fd9ba8cf9e6fb525eae7498148866ded31ec20c5c2087ffe47815ea1')
install=trex-bin.install

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/t-rex" "${pkgdir}/usr/bin/t-rex"
}
