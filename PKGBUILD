# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=ethminer-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Ethereum miner with OpenCL, CUDA and stratum support (precompiled binary)"
arch=('x86_64')
url="https://github.com/ethereum-mining/ethminer"
license=('MIT')
provides=('ethminer')
conflicts=('ethminer')
source=("https://github.com/ethereum-mining/ethminer/releases/download/v${pkgver}/ethminer-${pkgver}-linux-x86_64.tar.gz")
md5sums=('3b671e760c9009a9371c4be23ebead7b')
options=(!strip)

package() {
  install -Dm755 "$srcdir/bin/ethminer" "$pkgdir/usr/bin/ethminer"
  install -dm755 "$pkgdir/usr/bin/kernels/"
  install -Dm644 "$srcdir/bin/kernels/"*.bin "$pkgdir/usr/bin/kernels/"
}

# vim:set ts=2 sw=2 et:
