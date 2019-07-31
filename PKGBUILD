# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: mockroot <mockroot@zoho.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=vlc-pause-click-plugin
pkgver=2.1.0
pkgrel=1
pkgdesc='Plugin for VLC that pauses/plays video on mouse click'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/nurupo/vlc-pause-click-plugin'
depends=('vlc')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/nurupo/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('cebd9c0fe6273f4ff8cd2e114b4edc22376ce48d7c64b846391db71d80353bc7')

build() {
  cd $pkgname-$pkgver
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
