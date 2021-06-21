# Maintainer: jxir <aur@jxir.de>

pkgname=mucalc
pkgver=2.1
pkgrel=1
pkgdesc="Convenient calculator for the command line"
arch=('x86_64')
url="https://marlam.de/mucalc/"
license=('GPL3')
depends=('muparser' 'readline')
makedepends=('cmake')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('c7d4d13ebc2935bcd6cbef6a697aae572597f99f29c661995510e85fbd5ce58c')

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
