# Maintainer: krion <krionux@gmail.com>
pkgname=magi-qt
pkgver=0.1
pkgrel=1
pkgdesc="Magi (Coin Magi - XMG) is a hybrid PoW/PoS-based cryptocurrency. Magi is also a CPU coin. "
arch=('any')
url="https://github.com/magi-project/magi"
license=('')
depends=('qt5-base')
makedepends=('make' 'qt5-base')
provides=('magi-qt')
validpgpkeys=('046ACD2837CF8CE73E633F34049F37E7F991FB5F')

prepare() {
  git clone $url
  cd $srcdir/magi
  /usr/lib/qt/bin/qmake USE_UPNP=- -o Makefile magi-qt.pro
}

build() {
  cd $srcdir/magi
  make
}

package() {
  install -Dm755 "$srcdir/magi/magi-qt" "$pkgdir/usr/bin/magi-qt"
}
