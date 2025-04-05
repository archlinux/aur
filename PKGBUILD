# Maintainer: Tyler Triplett <tylertriplett@protonmail.com>
pkgname=natt
pkgver=1.0.1
pkgrel=1
pkgdesc="gtk3 X11 Screen Temperature Scheduler"
arch=('x86_64')
url="https://github.com/t-trpl/natt"
license=('GPL')
depends=('cmake' 'make' 'libayatana-appindicator' 'libx11' 'libxrandr' 'pkg-config' 'gtk3')
source=("git+https://github.com/t-trpl/natt.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  cmake -S . -B ./build
  make -C ./build -j$(nproc)
}

package() {
  cd "$srcdir/$pkgname/build"
  install -Dm755 ./natt "$pkgdir/usr/bin/natt"
}
