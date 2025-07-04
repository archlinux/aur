pkgname=brooklynn-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Brooklynn - A minimal tiling window manager"
arch=('x86_64')
url="https://github.com/FedGuy699/Brooklynn"
license=('custom')
depends=('xorg-server' 'libx11' 'libxext' 'libxrandr' 'freetype2')
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
  make
}

package() {
  cd "$srcdir/Brooklynn"
  install -Dm755 brooklynn "$pkgdir/usr/local/bin/brooklynn"
  install -Dm644 brooklynn.desktop "$pkgdir/usr/share/xsessions/brooklynn.desktop"
}

