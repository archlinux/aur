# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>
pkgname=mpristester-git
pkgver=9999
pkgrel=1
pkgdesc="Tester for MPRIS2 clients functionality"
arch=('i686' 'x86_64')
url="https://github.com/randomguy3/mpristester"
license=('custom:unknown')
depends=(
  qt5-base
)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname%-git}::git+https://github.com/randomguy3/mpristester.git")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  qmake ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  install -D -m755 mpristester "$pkgdir/usr/bin/mpristester"
}

# vim:set ts=2 sw=2 et:
