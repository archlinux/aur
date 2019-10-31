# Maintainer: Andres Rodriguez <andresx7@gmail.com>

pkgname=gpu-trace-git
pkgver=v2.0.r0.g1fbaa4f
pkgrel=1
pkgdesc="GPU Trace capture tool"
arch=('x86_64')
url="https://github.com/lostgoat/gpu-trace"
license=('MIT')
depends=('gpuvis-git' 'trace-cmd')
provides=('gpu-trace')
conflicts=('gpu-trace')
replaces=('amdgpu-trace')
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/gpu-trace"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/gpu-trace"
    install -dm755 "$pkgdir/usr/bin/"
    make INSTALL_ROOT="$pkgdir" INSTALL_PREFIX="/usr/" install
}
