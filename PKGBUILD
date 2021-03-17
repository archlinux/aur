# Maintainer: Andres Rodriguez <andresx7@gmail.com>

pkgname=gpu-trace
pkgver=v2.2
pkgrel=1
pkgdesc="GPU Trace capture tool"
arch=('x86_64')
url="https://github.com/lostgoat/gpu-trace"
license=('MIT')
depends=('gpuvis-git' 'trace-cmd')
provides=('gpu-trace' 'amdgpu-trace')
conflicts=('gpu-trace' 'amdgpu-trace')
source=("git+$url#tag=$pkgver")
sha256sums=("SKIP")

package() {
    cd "${srcdir}/gpu-trace"
    install -dm755 "$pkgdir/usr/bin/"
    make INSTALL_ROOT="$pkgdir" INSTALL_PREFIX="/usr/" install
}
