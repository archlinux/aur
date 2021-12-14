# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=nvidia-container-runtime-bin
_pkgname=nvidia-container-runtime

# 3.7.0 is not released as a bin yet. use the base package if you need it
pkgver=3.5.0

pkgrel=2
pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('BSD')

depends=('libseccomp' 'nvidia-container-toolkit>=1.4.0')
provides=('nvidia-container-runtime=3.5.0')
conflicts=('nvidia-container-runtime')

# from browsing https://github.com/NVIDIA/nvidia-container-runtime/tree/gh-pages/stable
source=("https://nvidia.github.io/nvidia-container-runtime/centos7/$CARCH/${_pkgname}-${pkgver}-1.$CARCH.rpm")
sha256sums=('1c4a992a0b41dceca8a9217f6b702c899dfc3b1152a461ad9b78b33f7b95c4b9')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 usr/share/licenses/${_pkgname}-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
