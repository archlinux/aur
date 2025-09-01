pkgname=maxfan
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple ThinkPad fan control wrapper"
arch=('x86_64')
url="https://github.com/NotiLo-A/MaxFan"
license=('GPL3')
depends=()
makedepends=('gcc')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/MaxFan-$pkgver"
  g++ main.cpp -std=c++11 -O2 -o maxfan
}

package() {
  install -Dm755 "$srcdir/MaxFan-$pkgver/maxfan" "$pkgdir/usr/bin/maxfan"
}

