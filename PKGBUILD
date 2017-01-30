# Maintainer: NBonaparte

pkgname=yabar
pkgver=0.5.0
pkgrel=1
pkgdesc="A modern and lightweight status bar for X window managers"
arch=('i686' 'x86_64')
url="https://github.com/yabar-dev/yabar"
license=('MIT')
depends=('cairo' 'alsa-lib' 'pango' 'libconfig' 'xcb-util-wm')
source=($pkgname-$pkgver.tar.gz::https://github.com/yabar-dev/yabar/archive/$pkgver.tar.gz)
md5sums=('264a1813ff3cfa45994c3cf56d3d99f0')

build() {
  cd $pkgname-$pkgver
  sed -ie "s/\$(VERSION)/$pkgver/" Makefile
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
