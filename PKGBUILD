# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=vlc-pause-click-plugin
pkgver=0.3.2
pkgrel=1
pkgdesc='This plugin allows you to pause/play a video by clicking on the video image'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/nurupo/vlc-pause-click-plugin'
depends=('vlc')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/nurupo/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0abe87764dcdb69108ff077be4e21cae186d2c03ad00ae991d3b850bf9c6dd4c')

build() {
  cd $pkgname-$pkgver/vlc-2.2.x+
  make CFLAGS="$CFLAGS"
}

package() {
  cd $pkgname-$pkgver/vlc-2.2.x+
  make DESTDIR="$pkgdir" install
}
