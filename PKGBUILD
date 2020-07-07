# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=gdlmm
pkgver=3.7.3
pkgrel=5
pkgdesc='C++ bindings for the gdl library'
arch=('x86_64')
url='https://git.gnome.org/browse/gdlmm/'
depends=('gdl' 'gtkmm3')
options=('!emptydirs')
license=('LGPL')
source=("https://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('e280ed9233877b63ad0a0c8fb04d2c35dc6a29b3312151ee21a15b5932fef79b')

build() {
  cd "$pkgname-$pkgver"

  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
