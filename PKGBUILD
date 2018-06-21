# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Nathan Dyer <https://github.com/nathandyer>

pkgname=vocal
pkgver=2.2.0
pkgrel=2
pkgdesc='Powerful, beautiful and simple podcast client for the modern free desktop'
arch=(x86_64)
url='https://vocalproject.net/'
license=(GPL3)
depends=(clutter-gst clutter-gtk granite gst-plugins-good gst-libav libnotify)
makedepends=(cmake vala webkit2gtk)
source=("$pkgname-$pkgver.tar.gz::https://github.com/needle-and-thread/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2f9c5a3273cc0f6af9361f82258bebe221770fe5f7c2e46f378ca41b4c450e7c')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
