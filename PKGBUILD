# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=vlc-pause-click-plugin
pkgver=0.4.0
pkgrel=1
pkgdesc='This plugin allows you to pause/play a video by clicking on the video image'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/nurupo/vlc-pause-click-plugin'
depends=('vlc')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/nurupo/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('4ed94c9a12cb0992ecbe924a24fe652295ae0727d3406c44b658a7897b7c1e24')

build() {
  cd $pkgname-$pkgver
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
