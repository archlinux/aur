# Maintainer: Jordan Day < jordanday444 at gmail dot com >
# Contributor: Lars Rustand <rustand dot lars at gmail dot com>

pkgname=claymore-miner-bin
pkgver=15.0
pkgrel=3
pkgdesc="Claymore's dual Ethereum GPU miner"
url="https://github.com/Claymore-Dual/Claymore-Dual-Miner/"
arch=("i686" "x86_64")
license=("unknown")
depends=("glibc")
source=("${pkgname}-${pkgver}.zip::https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/${pkgver}/Claymore.s.Dual.Ethereum.AMD+NVIDIA.GPU.Miner.v${pkgver}.-.LINUX.zip")
sha256sums=('de1bc82c4594284db54c4cbd8fb76efe270fc9de7e6e9a0b1b688776876716ce')

package() {
   mkdir -p $pkgdir/usr/share
   cp -r "$srcdir/Claymore.s.Dual.Ethereum.AMD+NVIDIA.GPU.Miner.v${pkgver}.-.LINUX" $pkgdir/usr/share/${pkgname}

   mkdir -p $pkgdir/usr/bin
   ln -s /usr/share/${pkgname}/ethdcrminer64 $pkgdir/usr/bin/ethdcrminer64
   chmod +x $pkgdir/usr/share/${pkgname}/ethdcrminer64
}
