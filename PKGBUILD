# Maintainer: Justin Zobel <justin.zobel@gmail.com>
pkgname=journal
pkgver=1.0.1
pkgrel=4
pkgdesc="A GTK3 Text Editor"
url="https://github.com/evolve-os/journal/"
license=('GPLv2')
arch=('x86_64')
depends=(vala gtksourceview3 gtk3 libsoup json-glib)
makedepends=cmake
source=${url}archive/v${pkgver}.tar.gz
sha256sums=('94afb8518fdb6dffdba7cb8bd14ca9ca6a1d631b47586537d8a1b693793961f9')
install=${pkgname}.install

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
