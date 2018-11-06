# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Nathan Dyer <https://github.com/nathandyer>

pkgname=vocal
pkgver=2.3.0
pkgrel=1
pkgdesc='Powerful, beautiful and simple podcast client for the modern free desktop'
arch=(x86_64)
url='https://vocalproject.net/'
license=(GPL3)
depends=(clutter-gst clutter-gtk granite gst-plugins-good gst-libav libnotify)
makedepends=(cmake vala webkit2gtk)
source=("$pkgname-$pkgver.tar.gz::https://github.com/needle-and-thread/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('af5fa7e75871189a46a2738d98ed799c9880f4168a6274ca1991f59a2b83a80091313935e6f6953756d0063d4a2c0a90e7ddb456be892397025130e565c86fa9')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
