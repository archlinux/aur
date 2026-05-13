pkgname=learn-arch
pkgver=1.0.0
pkgrel=1
pkgdesc="A beginner-friendly Arch Linux learning simulator"
arch=('x86_64')
url="https://github.com/NiamhDriscoll/learn-arch"
license=('MIT')
depends=()
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NiamhDriscoll/learn-arch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/learn-arch-$pkgver"
  g++ -std=c++20 main.cpp -o learn-arch
}

package() {
  cd "$srcdir/learn-arch-$pkgver"
  install -Dm755 learn-arch "$pkgdir/usr/bin/learn-arch"
}
