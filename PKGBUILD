#Maintainer: M0Rf30

pkgname=aliwe-git
pkgver=49.92340f8
pkgrel=1
pkgdesc="WPA passphrase generator for AGPF Alice Routers in C (WPA script called alish is included)"
arch=('i686' 'x86_64')
url="https://github.com/M0Rf30/aliwe"
license=('GPL3')
depends=(openssl)
makedepends=('git')
source=('aliwe::git://github.com/M0Rf30/aliwe.git')

build() {
  cd aliwe
  make
}

package(){
  cd aliwe
  make DESTDIR=$pkgdir install
  rm -rf "$srcdir/$_gitname-build"
}

pkgver() {
  cd aliwe
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
