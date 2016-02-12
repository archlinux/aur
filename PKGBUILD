# Maintainer: krion <krionux@gmail.com>
pkgname=magid
pkgver=0.1
pkgrel=1
pkgdesc="Magi (Coin Magi - XMG) is a hybrid PoW/PoS-based cryptocurrency. Magi is also a CPU coin. This is magid, the cli version of the magi wallet"
arch=('any')
url="https://github.com/magi-project/magi"
license=('')
depends=('')
makedepends=('make' '')
provides=('magid')
validpgpkeys=('046ACD2837CF8CE73E633F34049F37E7F991FB5F')

prepare() {
  git clone $url
  cd $srcdir/magi/src
  sed -i s/USE_UPNP:=0/USE_UPNP:=-/ makefile.unix
}

build() {
  cd $srcdir/magi/src
  make -f makefile.unix
}

package() {
  install -Dm755 "$srcdir/magi/src/magid" "$pkgdir/usr/bin/magid"
}
