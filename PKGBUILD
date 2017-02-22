# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=vlc-pause-click-plugin
pkgver=0.3.1
pkgrel=1
pkgdesc='This plugin allows you to pause/play a video by clicking on the video image'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/nurupo/vlc-pause-click-plugin'
depends=('vlc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nurupo/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('fa0e29aaae8088c0d5d1cec499f997cd3f076bcf5efd48b0f0470027563b10d6')

prepare() {
  cd $pkgname-$pkgver/vlc-2.2.x+
  # Use Arch's CFLAGS
  sed -i "s/CFLAGS = -g -O2/CFLAGS = $CFLAGS/" Makefile
}

build() {
  cd $pkgname-$pkgver/vlc-2.2.x+
  make
}

package() {
  cd $pkgname-$pkgver/vlc-2.2.x+
  make DESTDIR="$pkgdir" install
}
