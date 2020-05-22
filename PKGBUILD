# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=libnvidia-container-bin
_pkgname=libnvidia-container

pkgver=1.1.1
pkgrel=1

pkgdesc='NVIDIA container runtime library'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('Apache')

depends=('libcap' 'libseccomp')
provides=("libnvidia-container=$pkgver")
conflicts=('libnvidia-container')

source=("https://nvidia.github.io/libnvidia-container/centos7/$CARCH/${_pkgname}1-${pkgver}-1.$CARCH.rpm"
        "https://nvidia.github.io/libnvidia-container/centos7/$CARCH/${_pkgname}-devel-${pkgver}-1.$CARCH.rpm")
sha256sums=('fd9fc6946d5105c51b94d17398259d70cff9b3259fc6cf13a5538dafb3b87b32'
            'a61074e27d42a4e2fedd5196859887e7bea3fc62b23412e58ec64213fa850093')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/lib"
  cp -a usr/lib64/* "$pkgdir/usr/lib/"
  install -D -m644 usr/include/nvc.h "$pkgdir/usr/include/nvc.h"
}
