# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=ethminer-bin
pkgver=0.18.0
pkgrel=2
pkgdesc="Ethereum miner with OpenCL, CUDA and stratum support (precompiled binary)"
arch=('x86_64')
url="https://github.com/ethereum-mining/ethminer"
license=('GPL3')
provides=('ethminer')
conflicts=('ethminer')
source=("https://github.com/ethereum-mining/ethminer/releases/download/v${pkgver}/ethminer-${pkgver}-cuda-9-linux-x86_64.tar.gz")
sha1sums=('3623bb37984f5a3ccf49555ac591eb932015399a')
options=(!strip)

package() {
  install -Dm755 "$srcdir/bin/ethminer" "$pkgdir/usr/bin/ethminer"
  install -dm755 "$pkgdir/usr/bin/kernels/"
  install -Dm644 "$srcdir/bin/kernels/"*.bin "$pkgdir/usr/bin/kernels/"
}

# vim:set ts=2 sw=2 et:
