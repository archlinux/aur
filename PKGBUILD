# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cxx
pkgver=3.3.3
pkgrel=2
pkgdesc='Compile C++ code by detecting flags and includes automatically'
arch=(any)
url='https://github.com/xyproto/cxx'
license=(BSD-3-Clause)
makedepends=(git)
depends=(scons)
optdepends=('ccache: For faster builds'
            'clang: For clang-format and for clang++'
            'gprof2dot: For visualizing profiling information'
            'graphviz: For visualizing profiling information'
            'kcachegrind: For visualizing profiling information'
            'lldb: For debugging'
            'mingw-w64-gcc: For compiling 64-bit Windows executables'
            'valgrind: For tracing calls and profiling'
            'wine: For running 64-bit Windows exectuables')
source=("git+$url#tag=$pkgver")
b2sums=('6a69a4ceccd2ec4c8d0cb00288398ec6243c803f9b40bedf16fa5b00a5bf3ef386d2e7cc6c7a3c7ce18ed95a49ec80301f90f90ac2b05b4589d0bc0c56189bd8')

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
