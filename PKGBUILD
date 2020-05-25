# Maintainer: Marek Chlupa <mchqwerty at gmail dot com>
pkgname=dg-git
pkgver=a55a4665
pkgrel=1
pkgdesc="A program analysis library containing a static backward slicer for LLVM bitcode"
arch=(x86_64)
url="https://github.com/mchalupa/dg"
license=('MIT')
groups=()
depends=(llvm clang gcc python)
makedepends=(git cmake make)
optdepends=()
provides=(llvm-slicer)
conflicts=(llvm-slicer)
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/mchalupa/dg)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd dg
  git rev-parse --short=8 HEAD
}

build() {
  cd dg
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd dg
  make DESTDIR="$pkgdir/" install
}
