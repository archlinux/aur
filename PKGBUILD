# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@gmail.com>

pkgname=libtsm
pkgver=4.3.0
pkgrel=1
pkgdesc='Terminal-emulator State Machine'
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/kmscon/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'check' 'libxkbcommon')
options=(!libtool)
source=("https://github.com/Aetf/libtsm/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7e858bece0df5b0cc61fbcc99275f6828bf54007a88fa8459a8447a7ee7e67ad')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
