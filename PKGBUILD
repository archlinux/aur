# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=peakperf
pkgver=1.17
pkgrel=1
pkgdesc="Microbenchmark to achieve peak performance on x86_64 CPUs and NVIDIA GPUs"
url="https://github.com/Dr-Noob/peakperf"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=()
makedepends=('cmake')
optdepends=('cuda:       GPU mode support'
	    'cuda-tools: GPU mode support')
conflicts=("peakperf-git")
provides=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dr-Noob/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c048163ba384dfa4e7232e18f03a372a913ea7f96e467826c5b28350fea816ef')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE="Release" -S ./ -B ./
  make
}

package() {
  install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
}
