
# Maintainer: Your Name <syamajala AT gmail DOT com>
pkgname=python-redland
pkgver=1.0.17.1
pkgrel=1
pkgdesc="Python bindings for Redland librdf."
arch=(any)
url="http://librdf.org/bindings/"
license=('LGPL')
depends=('python3' 'redland')
makedepends=('swig')
install=
changelog=
source=($pkgname-$pkgver.tar.gz::http://download.librdf.org/source/redland-bindings-${pkgver}.tar.gz)
noextract=()
md5sums=('b13c3d0e1bf291b071aae73603e70e65')
build() {
  cd "$srcdir/redland-bindings-$pkgver"
  ./configure --prefix=/usr --with-python=python3
  make
}

check() {
  cd "$srcdir/redland-bindings-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/redland-bindings-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
