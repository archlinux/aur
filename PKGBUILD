# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>

pkgname=libgit2-git
pkgver=0.25.1
pkgrel=1
epoch=1
pkgdesc='A linkable library for Git'
arch=('i686' 'x86_64')
url='https://libgit2.github.com/'
depends=(zlib openssl libssh2 curl)
makedepends=(cmake python)
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/libgit2/libgit2/archive/v${pkgver}.tar.gz")
sha1sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  export LANG=en_US.UTF-8
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTHREADSAFE=ON
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
