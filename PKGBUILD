# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=libnvidia-container-tools-bin
_pkgname=libnvidia-container-tools

pkgver=1.0.2
pkgrel=1

pkgdesc='NVIDIA container runtime library (command-line tools)'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('BSD')

depends=('libnvidia-container')
provides=('libnvidia-container-tools=1.0.2')
conflicts=('libnvidia-container-tools')

source=("https://nvidia.github.io/libnvidia-container/centos7/${CARCH}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('3a7ed1ac6b9da17792516b4f418f362a1b9591fda34f82e544077d1177c954da')

package() {
  cd "$srcdir"
  install -D -m755 usr/bin/nvidia-container-cli "$pkgdir/usr/bin/nvidia-container-cli"
  install -D -m644 usr/share/licenses/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
