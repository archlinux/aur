# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=libnvidia-container-tools-bin
_pkgname=libnvidia-container-tools

pkgver=1.9.0
pkgrel=1

pkgdesc='NVIDIA container runtime library (command-line tools)'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('Apache')

depends=('libnvidia-container')
provides=('libnvidia-container-tools=$pkgver')
conflicts=('libnvidia-container-tools')

source=("${_pkgname}-${pkgver}-1-${pkgrel}.${CARCH}.rpm::https://nvidia.github.io/libnvidia-container/centos7/${CARCH}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('9edf45e92759b90d77502c612caa1b0202919f376b8d685b38f99fc8fd9e6b16')

package() {
  cd "$srcdir"
  install -D -m755 usr/bin/nvidia-container-cli "$pkgdir/usr/bin/nvidia-container-cli"
}
