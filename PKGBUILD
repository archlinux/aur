pkgname=brooklynn
pkgver=1.0.0
pkgrel=1
pkgdesc="Brooklynn - A minimal tiling window manager"
arch=('x86_64')
url="https://github.com/FedGuy699/Brooklynn"
license=('custom')
depends=('xorg-server' 'libx11' 'libxext' 'libxrandr')
makedepends=('git' 'gcc')
provides=('brooklynn')
conflicts=('brooklynn')
source=("git+https://github.com/FedGuy699/Brooklynn.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Brooklynn"
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Brooklynn"
  g++ -std=c++17 -Wall -Wextra -O2 brooklynn.cpp -o brooklynn -lX11 -lXrandr
}

package() {
  cd "$srcdir/Brooklynn"
  install -Dm755 brooklynn "$pkgdir/usr/local/bin/brooklynn"
  install -Dm644 brooklynn.desktop "$pkgdir/usr/share/xsessions/brooklynn.desktop"
}

