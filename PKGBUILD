# Maintainer: Lars Rustand <rustand dot lars at gmail dot com>

pkgname=claymore-miner-bin
pkgver=14.7
pkgrel=1
pkgdesc="Claymore's dual Ethereum GPU miner"
url="https://github.com/Claymore-Dual/Claymore-Dual-Miner/"
arch=("i686" "x86_64")
license=("unknown")
depends=("glibc")
source=("${pkgname}-${pkgver}.zip::https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/${pkgver}/Claymore.s.Dual.Ethereum.AMD+NVIDIA.GPU.Miner.v${pkgver}.-.LINUX.zip")
sha256sums=('13e48d0732ee21571d6c397d77926c36ae0ace5458ef1e4c383d6565cfcf1ba9')

package() {
   mkdir -p $pkgdir/usr/share
   cp -r "$srcdir/Claymore's Dual Ethereum AMD+NVIDIA GPU Miner v${pkgver} - LINUX" $pkgdir/usr/share/${pkgname}

   mkdir -p $pkgdir/usr/bin
   ln -s /usr/share/${pkgname}/ethdcrminer64 $pkgdir/usr/bin/ethdcrminer64
   chmod +x $pkgdir/usr/share/${pkgname}/ethdcrminer64
}
