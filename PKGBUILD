# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: mockroot <mockroot@zoho.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=vlc-pause-click-plugin
pkgver=2.2.0
pkgrel=1
pkgdesc='Plugin for VLC that pauses/plays video on mouse click'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/nurupo/vlc-pause-click-plugin'
depends=('vlc')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/nurupo/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2a2cd76bc0bc10cb5f7c2143ae8508008c5a100f9a9c19b4fbc2c517983ded4c')

build() {
  cd $pkgname-$pkgver
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
