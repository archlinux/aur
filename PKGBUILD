# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=fifth
pkgver=0.5
pkgrel=1
pkgdesc="Browser that carries the best features from Opera"
arch=('i686' 'x86_64')
url="http://fifth-browser.sourceforge.net"
license=('GPL3')
depends=('webkitfltk' 'fltk' 'sqlite' 'liburlmatch' 'physfs' 'libxslt' 'curl' 'harfbuzz-icu' 'libjpeg-turbo' 'cairo')
source=($pkgname-$pkgver.tar.gz::https://github.com/clbr/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('d92ad2f792b96d8750edf8df17ad2d32')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -i
  ./configure
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
