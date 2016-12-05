# Maintainer: Lieven Moors <lievenmoors@gmail.com>

pkgname=x42-plugins
pkgver=20160825
pkgrel=1
pkgdesc="Collection of LV2 plugins"
arch=('i686' 'x86_64')
url="https://github.com/x42/x42-plugins"
license=('GPL')
depends=('pango' 'jack' 'liblo' 'zita-convolver>3' 'libltc')
makedepends=('gtk2' 'ftgl' 'ttf-freefont' 'lv2>1.6.0')
groups=('lv2-plugins')
source=("http://gareus.org/misc/x42-plugins/$pkgname-$pkgver.tar.xz")
md5sums=('0d1e131ccbf3bc9318897d59c554a2e0')

build() {
  cd "$pkgname-$pkgver"
  FONTFILE=/usr/share/fonts/TTF/FreeSansBold.ttf make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir/" PREFIX=/usr
}

# vim:set ts=2 sw=2 et:
