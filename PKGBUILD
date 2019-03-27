# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=corebird
pkgver=1.7.4
pkgrel=2
pkgdesc="Native Gtk+ Twitter client for the Linux desktop"
arch=(x86_64)
url="https://corebird.baedert.org/"
license=(GPL3)
depends=(gspell gst-libav gst-plugins-bad gst-plugins-good)
makedepends=(vala)
source=("https://github.com/baedert/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('7c53a356eded58eca423128b28685107a11d3f7bb0a08e0fc072b60c2b0f0041')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
