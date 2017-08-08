# Maintainer: Carlos Toro <ertsheiker at gmail dot com>

pkgname=minergate
pkgver=6.8
pkgrel=3
pkgdesc='Cryptocurrency GUI miner and Mining Pool'
arch=('x86_64')
url='http://www.minergate.com/'
provides=('minergate')
license=('custom')
source=('https://minergate.com/download/ubuntu')
md5sums=('4e43794f641bdeba98fe5ce679bfcf83')
depends=('qt5-base'
         'gcc-libs-multilib'
         'qt5-websockets'
         'ocl-icd')
optdepends=('bfgminer'
            'cuda: if you have an nvidia GPU')
install=${pkgname}.install

package() {
  bsdtar xf data.tar.gz
  rm -r opt/minergate/lib/libcudart.so.8.0*
  rm -r opt/minergate/lib/libOpenCL.so*
  rm -r opt/minergate/share
  chmod -R g-w usr opt
  mv usr opt "${pkgdir}"
}
