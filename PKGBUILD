# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.2.1
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
sha256sums=('53f7715668c1642b54f6a82a832b3d86b7bda108cafc4009f41eb61b72fd294d')

build () {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package () {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
