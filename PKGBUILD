# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.3.1
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
sha256sums=('27f215aad77b98439e8e9e35e71848e294bc1d8e8fbde995fe5965a51fc896ce')

build () {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package () {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
