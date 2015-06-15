# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=libbson-git
pkgver=20130722
pkgrel=1
pkgdesc="A BSON utility library"
arch=('i686' 'x86_64')
url="https://github.com/mongodb/libbson"
license=('Apache')
depends=()
makedepends=('git' 'automake' 'autoconf' 'libtool' 'make' 'gcc')
provides=('libbson')
conflicts=('libbson')
source=('git://github.com/mongodb/libbson.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libbson"
  git log -1 --format="%cd" --date=short | tr -d -
}

build() {
  cd "$srcdir/libbson"
  ./autogen.sh --enable-silent-rules --prefix=/usr
  make
}

package() {
  cd "$srcdir/libbson"
  make install DESTDIR="$pkgdir"
}
