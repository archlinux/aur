# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: mockroot <mockroot@zoho.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=vlc-pause-click-plugin
pkgver=2.0.0
pkgrel=1
pkgdesc='Plugin for VLC that pauses/plays video on mouse click'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/nurupo/vlc-pause-click-plugin'
depends=('vlc')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/nurupo/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('49734733b5307c5353d952a7ed2c81b534504716d5d5e64fb9b292773b72adbc')

build() {
  cd $pkgname-$pkgver
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
