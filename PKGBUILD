# Maintainer: Luke
pkgname=lambda
pkgver=0.1.13
pkgrel=1
pkgdesc='Lambda calculus beta-reduction playground with ncurses and CLI front ends'
arch=('x86_64')
url='https://github.com/drmenguin/lambda'
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Regenerate after the v0.1.13 source archive exists.
sha256sums=('8996c78221d72a1136c5a47165e5b8d21e3449a0bf6e47e424036b0df129177a')

build() {
  cd "$pkgname-$pkgver"
  make clean
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
