# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=binaryen-git
pkgver=20160119
pkgrel=1
pkgdesc="Compiler infrastructure and toolchain library for WebAssembly, in C++"
arch=(i686 x86_64)
url="https://github.com/WebAssembly/binaryen"
license=('MIT')
depends=()
makedepends=('emscripten' 'git' 'python2' 'cmake')
provides=(binaryen)
conflicts=(binaryen)
source=('git://github.com/WebAssembly/binaryen.git')
md5sums=(SKIP)

check() {
  cd binaryen

  python2 update.py
}

build() {
  cd binaryen

  rm -rf build && mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd binaryen/build

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
