# Maintainer: Luke
pkgname=lambda
pkgver=0.2
pkgrel=1
pkgdesc='Lambda calculus beta reduction playground with optional eta and ncurses/CLI front ends'
arch=('x86_64')
url='https://github.com/drmenguin/lambda'
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Regenerate after the v0.2 source archive exists.
sha256sums=('27009053e5f6b65f503cc60eb4473ac2a924192ce4d8ca84940aee2a8f198ac3')

build() {
  cd "$pkgname-$pkgver"
  make clean
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
