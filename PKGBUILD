# Maintainer: orhun <github.com/orhun>
pkgname=k3rmit
pkgdesc="A VTE-based terminal emulator that aims to be simple, fast and effective."
pkgver=1.8
pkgrel=1
arch=('any')
url="https://github.com/orhun/k3rmit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('cmake')
provides=("$pkgname")
conflicts=("$pkgname")
source=('https://github.com/orhun/k3rmit/archive/1.8.tar.gz')
sha256sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  mkdir -p build && cd build/
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}