# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Nathan Dyer <https://github.com/nathandyer>

pkgname=vocal
pkgver=2.4.0
pkgrel=1
pkgdesc='Powerful, beautiful and simple podcast client for the modern free desktop'
arch=(x86_64)
url='https://vocalproject.net/'
license=(GPL3)
depends=(clutter-gst clutter-gtk granite gst-plugins-good gst-libav libnotify)
makedepends=(cmake vala webkit2gtk)
source=("$pkgname-$pkgver.tar.gz::https://github.com/needle-and-thread/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('56265b46b6dc67a3d9041298677b775494b6d7127ff084483874c853042361305b10a59682f6ef66139814794afc0fdd1ff5c7cc410133763d2ff88e300dcb11')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
