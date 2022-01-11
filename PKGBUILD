# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=glitz
pkgver=0.5.6
pkgrel=8
pkgdesc='OpenGL image compositing library'
arch=('x86_64')
url='https://www.freedesktop.org/wiki/Software/glitz/'
license=('BSD')
depends=('libgl' 'glibc')
makedepends=('mesa-libgl')
source=("https://cairographics.org/snapshots/$pkgname-$pkgver.tar.gz")
sha256sums=('132adf06e48531f4c01b6ba5843881e2b584a170c5222353d03cbef736d4a471')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr CFLAGS="-Wno-error"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
