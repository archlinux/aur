# Maintainer: Meilin Shi <meilin.shi@ecovacs.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=spice-eco
pkgver=0.14.3
pkgrel=2
pkgdesc="SPICE server"
arch=('x86_64')
url="https://www.spice-space.org"
license=('LGPL2.1')
depends=('pixman' 'opus' 'libjpeg-turbo' 'glib2' 'libsasl' 'lz4')
makedepends=('meson' 'spice-protocol' 'libcacard')
checkdepends=('gdk-pixbuf2' 'glib-networking')
provides=('libspice-server.so')
source=("https://github.com/meilin-shi/archlinux/raw/master/$pkgname-$pkgver.tar.bz2")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
#  DESTDIR="$pkgdir" meson install -C build
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
