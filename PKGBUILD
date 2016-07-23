# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Valsu [arch(at)hylia.de]

pkgname='prboom-plus'
pkgver='2.5.1.4'
pkgrel='1'
pkgdesc='An advanced, Vanilla-compatible Doom engine based on PrBoom'
url='http://prboom-plus.sourceforge.net/'
arch=('x86_64' 'i686')
license=('GPL2')
depends=('dumb' 'fluidsynth' 'glu' 'libmad' 'portmidi' 'sdl_image' 'sdl_mixer' 'sdl_net')
conflicts=('prboom-plus-svn')
source=("http://download.sourceforge.net/prboom-plus/prboom-plus-$pkgver.tar.gz")
md5sums=('eff7878d4542259a2bd6b2fef79962ca')

build() {
  cd "prboom-plus-$pkgver"

  ./configure --prefix=/usr --disable-dogs
  make
}

package() {
  cd "prboom-plus-$pkgver"

  make DESTDIR="$pkgdir" gamesdir=/usr/bin install
}

