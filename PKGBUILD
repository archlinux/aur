# Maintainer: Dr-Noob <peibolms at gmail dot com>
_name=peakperf
pkgname="$_name-git"
pkgver=1.0
pkgrel=1
pkgdesc="Benchmark to achieve peak performance on x86_64 CPUs"
arch=('x86_64')
url="https://github.com/Dr-Noob/peakperf"
license=('MIT')
depends=('glibc' 'gcc-libs' 'make')
makedepends=('git')
source=("git+https://github.com/Dr-Noob/peakperf")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_name"
  make
}

package() {
  cd "$srcdir/$_name"
  install -Dm755 "peakperf"   "$pkgdir/usr/bin/peakperf"
  install -Dm644 "LICENSE"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
