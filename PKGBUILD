# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=aomp-amdgpu
pkgver=3.5.0
pkgrel=1
pkgdesc="Clang/LLVM based compiler with added support for the OpenMP API on
Radeon GPUs"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/aomp"
license=('Apache-2.0')
depends=('pciutils' 'numactl' 'libelf' 'libffi' 'python' 'openmpi')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm-Developer-Tools/aomp/archive/rocm-$pkgver.tar.gz")
sha256sums=('e4526489833896bbc47ba865e0d115fab278ce269789a8c99a97f444595f5f6a')

build() {
  cd ${srcdir}/aomp-rocm-$pkgver
  nohup make
}

package() {
  cd ${srcdir}/aomp-rocm-$pkgver
  make DESTDIR="$pkgdir" install
}
