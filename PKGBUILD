# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@gmail.com>

pkgname=libtsm
pkgver=4.2.0
pkgrel=1
pkgdesc='Terminal-emulator State Machine'
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/kmscon/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'check' 'libxkbcommon')
options=(!libtool)
source=("https://github.com/Aetf/libtsm/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1fa400d669a7b31df0e1953a193d648d2da7ebc674e606f10ae36db90c7f5337')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
