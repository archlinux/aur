# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>

pkgname=boolector-java
pkgver=3.2.0
pkgrel=1
pkgdesc="Java bindings for the Boolector SMT solver"
arch=('i686' 'x86_64')
url="http://boolector.github.io/"
license=('MIT')
depends=("boolector")
makedepends=("make" "git" "gcc")

source=("https://github.com/AbdullinAM/JavaBoolector/releases/download/3.2.0/boolector-java-3.2.0-sources.tar.gz")
sha256sums=('SKIP')
sha512sums=('SKIP')

build() {
  cd "$srcdir/boolector-java-3.2.0"
  make
}

package() {
  cd "$srcdir/boolector-java-3.2.0"

  libdir="$pkgdir/usr/lib"
  includedir="$pkgdir/usr/include/boolector-java"

  mkdir -p "$libdir"
  mkdir -p "$includedir"

  install -m755 ./lib/*.so "$libdir"
  install -m644 ./src/main/c/*.h "$includedir"
}
