# Maintainer: Andres Rodriguez <andresx7@gmail.com>

pkgname=amdgpu-trace-git
pkgver=v1.1.r1.g47551c6
pkgrel=1
pkgdesc="Trace capture helper for amdgpu based systems"
arch=('x86_64')
url="https://github.com/lostgoat/amdgpu-trace"
license=('MIT')
depends=('gpuvis-git' 'trace-cmd')
provides=('amdgpu-trace')
conflicts=('amdgpu-trace')
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/amdgpu-trace"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/amdgpu-trace"
  install -dm755 "$pkgdir/usr/bin/"
  make INSTALL_PATH="$pkgdir/usr/" install
}
