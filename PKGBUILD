# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.2
pkgrel=2
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
makedepends=('boost')
depends=('liblcf>=0.2' 'sdl2_mixer' 'pixman')
install=$pkgname.install
source=("https://easy-rpg.org/downloads/player/$pkgname-$pkgver.tar.gz")
sha256sums=('b3592df3334554f6ab8f1e3972dc844305e48daf2722c4b0876288e474ce3300')

build () {
  cd $pkgname-$pkgver

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package () {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
