# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=moonjit
pkgver=2.2.0
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1, with 5.2/3 support'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
conflicts=('luajit')
provides=('luajit')
depends=('gcc-libs')
source=("https://github.com/moonjit/moonjit/archive/$pkgver.tar.gz")
sha256sums=('83deb2c880488dfe7dd8ebf09e3b1e7613ef4b8420de53de6f712f01aabca2b6')

build() {
  cd "$pkgname-$pkgver"
  make amalg PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
