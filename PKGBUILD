# Maintainer: Carlos Toro <ertsheiker at gmail dot com>

pkgname=minergate
pkgver=6.8
pkgrel=2
pkgdesc='Cryptocurrency GUI miner and Mining Pool'
arch=('x86_64')
url='http://www.minergate.com/'
provides=('minergate')
license=('custom')
source=('https://minergate.com/download/ubuntu')
md5sums=('4e43794f641bdeba98fe5ce679bfcf83')
depends=('qt5-base'
         'ocl-icd'
         'gcc-libs-multilib'
         'qt5-websockets')
optdepends=('bfgminer')
install=$pkgname.install

package() {
  bsdtar xf data.tar.gz
  rm -r opt/minergate/lib/libQt5*
  rm -r opt/minergate/platforms
  rm -r opt/minergate/share
  chmod -R g-w usr opt
  mv usr opt "${pkgdir}"
}
