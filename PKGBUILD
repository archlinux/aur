# Maintainer: kiendang and Joel Shapiro (jshapiro <a> nvidia)

pkgname=libnvidia-container-bin
_pkgname=libnvidia-container

pkgver=1.0.1

pkgrel=1
pkgdesc='NVIDIA container runtime library'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('BSD')

depends=('libcap' 'libseccomp')
provides=('libnvidia-container')
conflicts=('libnvidia-container')

source=("https://nvidia.github.io/libnvidia-container/centos7/$CARCH/${_pkgname}1-1.0.1-1.$CARCH.rpm"
        "https://nvidia.github.io/libnvidia-container/centos7/$CARCH/${_pkgname}-devel-1.0.1-1.$CARCH.rpm")
sha256sums=('bb422721c5c66be35e75bdad1bbe14d29529ea2e3fb30744f04b28e3b02d6ef9'
            'd88fea93e964b5cab728d586c4575c3632ba5c0e11dd681b16ead30c5b3d3e6c')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/lib"
  cp -a usr/lib64/* "$pkgdir/usr/lib/"
  install -D -m644 usr/include/nvc.h "$pkgdir/usr/include/nvc.h"
  install -D -m644 usr/share/licenses/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
