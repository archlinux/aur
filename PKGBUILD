# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=libnvidia-container-tools-bin
_pkgname=libnvidia-container-tools

pkgver=1.1.1
pkgrel=1

pkgdesc='NVIDIA container runtime library (command-line tools)'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('Apache')

depends=('libnvidia-container')
provides=('libnvidia-container-tools=$pkgver')
conflicts=('libnvidia-container-tools')

source=("${_pkgname}-${pkgver}-1-${pkgrel}.${CARCH}.rpm::https://nvidia.github.io/libnvidia-container/centos7/${CARCH}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('995df1ae1b5c923eda520c1636f61f6862afbcf23153fbd7b9078aa874a092b5')

package() {
  cd "$srcdir"
  install -D -m755 usr/bin/nvidia-container-cli "$pkgdir/usr/bin/nvidia-container-cli"
}
