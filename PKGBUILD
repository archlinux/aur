# Maintainer: Luca Carlon <carlon.luca@gmail.com>

pkgname=cgrc
pkgver=1.0.0
pkgrel=1
pkgdesc='Generic log formatter'
arch=(any)
url='https://github.com/carlonluca/cgrc'
license=(GPL)
depends=(qt6-base)
makedepends=(git cmake)
source=(git+https://github.com/carlonluca/cgrc.git#tag=v$pkgver)
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init
}

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}