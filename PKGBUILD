# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.5.0
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('GPL3')
depends=("liblcf>=$pkgver" 'sdl2_mixer' 'pixman' 'freetype2' 'libvorbis' 'mpg123'
         'libsndfile' 'speexdsp')
optdepends=('wine: for installing the run time packages (RTP)'
            'libxmp: decoder for tracker music, used by few games')
install=$pkgname.install
source=("https://easyrpg.org/downloads/player/$pkgname-$pkgver.tar.gz")
sha256sums=('21c9b95536fb6348e84b11ac8e5908688c6e61e9b4eb426247d546a44869241e')

build () {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --enable-fmmidi=fallback
  make
}

package () {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
