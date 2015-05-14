# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.3
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
makedepends=('boost')
depends=("liblcf>=$pkgver" 'sdl2_mixer' 'pixman')
optdepends=('wine: for installing the run time packages (RTP)')
install=$pkgname.install
source=("https://easy-rpg.org/downloads/player/$pkgname-$pkgver.tar.gz")
sha256sums=('57786018d91272f0a759dff91e2fff8cbacff770918c002d5c4daf65e28163d2')

build () {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package () {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
