# Maintainer: Felipe Morales <hel.sheep@gmail.com>
pkgname=plotinus-git
pkgver=1
pkgrel=1
pkgdesc="A searchable command palette in every modern GTK+ application"
arch=(any)
url="http://github.com/p-e-w/plotinus"
license=('GPL')
groups=()
makedepends=('vala' 'cmake')
depends=('gtk3')
source=('git://github.com/p-e-w/plotinus.git')
md5sums=('SKIP')
install=plotinus.install

build() {
  cd "$srcdir/plotinus"
  mkdir build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/plotinus/build"
  install -Dm755 libplotinus.so "$pkgdir/usr/lib/libplotinus.so"
}

# vim:set ts=2 sw=2 et:
