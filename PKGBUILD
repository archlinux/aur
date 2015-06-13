# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=konoha
pkgver=1.0.0.952
_pkgver=1.0.0
_rev=952
pkgrel=1
pkgdesc="A high speed static scripting language."
arch=('i686' 'x86_64')
url="http://code.google.com/p/konoha/"
license=('GPL3')
depends=('sqlite3' 'curl' 'libffi' 'pcre')
#optdepends=()
makedepends=('cmake')
source=(http://konoha.googlecode.com/files/$pkgname-$_pkgver-$_rev.tar.gz)
md5sums=('40c59114a0d09ac5b8e933fa336c67b5')

build() {
  cd "$srcdir/$pkgname-$_pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DFFI_INCLUDE_DIR=/usr/lib/libffi-3.0.10/include \
        -DLLVM_CONFIG="" \
        ../
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver/build"
  make DESTDIR="$pkgdir" install
}


