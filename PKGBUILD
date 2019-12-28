# Maintainer: jxir <aur@jxir.de>

pkgname=mucalc
pkgver=2.0
pkgrel=1
pkgdesc="Convenient calculator for the command line"
arch=('x86_64')
url="https://marlam.de/mucalc/"
license=('GPL3')
depends=('muparser' 'readline')
makedepends=('cmake')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('0fc049eb44cc4de525286c40981e3195530bc094e8b822b1b982affee463eedd')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
