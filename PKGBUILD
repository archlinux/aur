# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=fifth
pkgver=0.2
pkgrel=2
pkgdesc="Browser that carries the best features from Opera"
arch=('i686' 'x86_64')
url="http://fifth-browser.sourceforge.net"
license=('GPL3')
depends=('webkitfltk' 'liburlmatch-git' 'fltk' 'sqlite' 'physfs' 'libxslt' 'curl' 'harfbuzz-icu' 'libjpeg-turbo' 'cairo')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/clbr/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('4af11739796d5d9bf08f4cee3e796210')

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
