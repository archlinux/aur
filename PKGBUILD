# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=slay
pkgver=1.3.2
pkgrel=1
pkgdesc='Compile C++ code by detecting flags and includes automatically'
arch=(any)
url='https://github.com/xyproto/slay'
license=(BSD-3-Clause)
makedepends=(git go)
depends=(scons)
provides=(cxx)
replaces=(cxx)
optdepends=('ccache: For faster builds'
            'clang: For clang-format and for clang++'
            'gprof2dot: For visualizing profiling information'
            'graphviz: For visualizing profiling information'
            'kcachegrind: For visualizing profiling information'
            'lldb: For debugging'
            'mingw-w64-gcc: For compiling 64-bit Windows executables'
            'valgrind: For tracing calls and profiling'
            'wine: For running 64-bit Windows exectuables')
source=("git+$url#tag=v$pkgver")
b2sums=('ca4c35ce4c13474cd98551da5c9323951a6e5a57cc0373da080824415a700313a8984d3ea135ed42e6ee071163dfa0c351700fb60ef1e865796efd1b13468baa')

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /usr/bin/slay "$pkgdir/usr/bin/cxx"
}
