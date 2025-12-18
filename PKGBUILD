# Maintainer: keelah-mt <aur at keelah.cc>
pkgname=c2ffi-21-git
_pkgname=c2ffi
pkgdesc="Clang-based FFI wrapper generator"
url="https://github.com/rpav/c2ffi"
pkgver=21.1
pkgrel=1
makedepends=("git" "make" "cmake" "gcc")
depends=("clang>=21.0" "clang<22.0" "llvm>=21.0" "llvm<22.0" "libffi" "libedit" "zlib" "libxml2")
arch=(x86_64)
license=("LGPL-2.1")
provides=("c2ffi")
conflicts=("c2ffi" "c2ffi-git")
source=("git+https://github.com/keelah-mt/c2ffi.git")
sha256sums=("SKIP")

build() {
  cd "$srcdir/$_pkgname"
  cmake -S . -B ./build -DBUILD_CONFIG=Release -DCMAKE_INSTALL_PREFIX=/usr
  cd build && make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install
}
