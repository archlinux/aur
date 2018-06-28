# Contributor: grimi <grimi at poczta dot fm>
# Maintainer: grimi <grimi at poczta dot fm>

pkgname=mjwm
pkgver=4.0.0
pkgrel=1
pkgdesc="mjwm creates JWM application menu from (freedesktop) desktop files"
arch=('x86_64')
url="https://github.com/chiku/mjwm"
license=('GPL2')
depends=('jwm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chiku/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a58b2bc0577ba60822992dafe8d39c48d66c588e0ea1aea0c8818d880d7adfeb')


build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}


# vim:set ts=2 sw=2 sts=2 et:
