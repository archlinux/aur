# Maintainer: Lukas Epple <post@lukasepple.de>

_pkgname=libhttpseverywhere
pkgname="$_pkgname-git"
pkgver=31+g0d8f881
pkgrel=1
pkgdesc="library to use HTTPSEverywhere in desktop applications"
arch=('i686' 'x86_64')
url="https://github.com/grindhold/libhttpseverywhere/"
license=('LGPL3')
depends=('libgee' 'libxml2')
makedepends=('git' 'cmake' 'make' 'vala' 'valadoc-git' 'gobject-introspection')
conflicts=('libhttpseverywhere')
provides=('libhttpseverywhere')
source=(git+git://github.com/grindhold/libhttpseverywhere.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install
}
