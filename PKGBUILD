# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>

pkgname=stp-java
pkgver=2.3.3
pkgrel=2
pkgdesc="Java bindings for the STP SMT solver"
arch=('i686' 'x86_64')
url="http://stp.github.io/"
license=('Apache 2.0')
depends=("stp")
makedepends=("make" "git" "gcc")

source=("git+https://github.com/AbdullinAM/stp-java.git")
sha256sums=('SKIP')
sha512sums=('SKIP')

build() {
  cd "$srcdir/stp-java"
  make
}

package() {
  cd "$srcdir/stp-java"

  libdir="$pkgdir/usr/lib"

  mkdir -p "$libdir"

  install -m755 ./build/libs/*.so "$libdir"
}
