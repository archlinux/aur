# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Nathan Dyer <https://github.com/nathandyer>

pkgname=vocal
pkgver=2.4.2
pkgrel=1
pkgdesc='Powerful, beautiful and simple podcast client for the modern free desktop'
arch=(x86_64)
url='https://vocalproject.net/'
license=(GPL3)
depends=(clutter-gst clutter-gtk granite gst-plugins-good gst-libav libnotify)
makedepends=(cmake vala webkit2gtk)
source=("$pkgname-$pkgver.tar.gz::https://github.com/needle-and-thread/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2f5b09c1ca1c3a513c161d1973033d6ce3e2c6805f4390d2bc70764e95a5b1a1ed9e681d602d2a5be44cb145cbdb6885a7c8aff0a2005a24792171a200ae52de')

build() {
  cd $pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
