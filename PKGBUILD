# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>

pkgname=libgit2-git
pkgver=0.26.0
pkgrel=1
epoch=1
pkgdesc='A linkable library for Git'
arch=('i686' 'x86_64')
url='https://libgit2.github.com/'
depends=(zlib openssl libssh2 curl)
makedepends=(git cmake python)
license=('GPL2')
replaces=(libgit2)
source=("git+https://github.com/libgit2/libgit2.git")
sha1sums=('SKIP')

build() {
  cd "$srcdir/libgit2"
  export LANG=en_US.UTF-8
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTHREADSAFE=ON
  make
}

check() {
  cd "$srcdir/libgit2"
  make test
}

package() {
  cd "$srcdir/libgit2"
  make DESTDIR="$pkgdir" install
}
