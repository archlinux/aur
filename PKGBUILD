# Maintainer: Jeff Parent <jeff@commentedcode.org>
pkgname=doorlib
pkgver=0.9.6
pkgrel=1
pkgdesc="A library for writing native Unix bbs doors."
arch=('i686' 'x86_64')
url="http://www.mbse.eu/bbsing/doorlib/"
license=('GPL')
source=(http://www.mbse.eu/download/bbsing/$pkgname-$pkgver.tar.bz2
        libtool-bug.patch)
noextract=()
sha256sums=('6091dc60debfacbabf52767afb830d4e67e66d460a03cef16c3e40d8b7fe6d38'
            '65726269784996132a8e03d26d072f9175d0c70412154bd0b0931d351f847ed2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < ../libtool-bug.patch
  ./configure --prefix=/usr --exec-prefix="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr" prefix="/usr" exec_prefix="/usr"  DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
