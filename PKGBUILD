# Maintainer: EndlessEden <eden@rose.place>
pkgname=srbminer-multi
pkgver=0.6.7
pkgrel=1
pkgdesc="CPU & AMD GPU Miner: Mine up to 4 different algorithms/coins at the same time!"
arch=('x86_64')
url="https://github.com/doktor83/SRBMiner-Multi"
license=('Private')
depends=()
optdepends=('opencl-amd: For Mining on AMD GPUs')
source=($pkgname-$pkgver.tar.xz::'https://github.com/doktor83/SRBMiner-Multi/releases/download/0.6.7/SRBMiner-Multi-0-6-7-Linux.tar.xz')
md5sums=('f0dbe31b3cf58605fea8e8a1098ec3cb')

prepare() {
  cd "${srcdir}"
  mv "SRBMiner-Multi-0-6-7" "$pkgname-$pkgver"
}

package() {
  install -d "${pkgdir}"/opt/$pkgname
  install -d "${pkgdir}"/usr/bin/
  install -D "${srcdir}"/"$pkgname-$pkgver"/{*.sh,SRBMiner-MULTI} "${pkgdir}"/opt/$pkgname
  cp -r "${srcdir}"/"$pkgname-$pkgver"/{Cache,Examples,Help} "${pkgdir}"/opt/$pkgname
  ln -s /opt/$pkgname/SRBMiner-MULTI "${pkgdir}"/usr/bin/srbminer-multi
}
