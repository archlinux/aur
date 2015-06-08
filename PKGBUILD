# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: coolkehon <coolkehon@gmail.com>
# Contributor: iphone4g <iphone4g@linuxmail.org>

pkgname=i2p-messenger
pkgver=0.2.24
pkgrel=1
pkgdesc="Qt-based messenger for I2P network"
arch=('i686' 'x86_64')
url="http://echelon.i2p.rocks/qti2pmessenger/"
license=('GPL2')
conflicts=('i2p-messenger')
depends=('qt4' 'nas')
makedepends=('cmake')
source=(http://echelon.i2p.rocks/qti2pmessenger/I2P-Messenger_${pkgver}_Beta_src.zip)
sha256sums=('12b3d2381c0cccfaf1cdc2a0ac38887c2187b9b870596a4e1d1af9554aa44e55')

build() {
  cd "$srcdir/I2P-Messenger"

  chmod +x Unix_build.sh
  ./Unix_build.sh --R

  mkdir -p $pkgdir/opt/i2p/i2p-messenger
  cp -R $srcdir/I2P-Messenger/* $pkgdir/opt/i2p/i2p-messenger/
  install -d "$pkgdir/usr/bin"
  install -D -m755 I2P-Messenger "$pkgdir/opt/i2p/i2p-messenger"

  ln -s /opt/i2p/i2p-messenger/I2P-Messenger $pkgdir/usr/bin/i2p-messenger
}
