# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.3.2
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
makedepends=('boost')
depends=("liblcf>=$pkgver" 'sdl2_mixer' 'pixman' 'freetype2')
optdepends=('wine: for installing the run time packages (RTP)')
install=$pkgname.install
source=("https://easy-rpg.org/downloads/player/$pkgname-$pkgver.tar.gz")
sha256sums=('4e1639c4acdd584d65043712b87f8ccdd1501954f4d955e416dba3697d9e17ab')

build () {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package () {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
