# Maintainer: Luke
pkgname=lambda
pkgver=0.1.14
pkgrel=1
pkgdesc='Lambda calculus beta-reduction playground with ncurses and CLI front ends'
arch=('x86_64')
url='https://github.com/drmenguin/lambda'
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Regenerate after the v0.1.14 source archive exists.
sha256sums=('4969ef4efed287a560938f5954dc2cf671b94c38863978444d0ba242155a3d15')

build() {
  cd "$pkgname-$pkgver"
  make clean
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
