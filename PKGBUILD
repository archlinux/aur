# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=libnvidia-container-bin
_pkgname=libnvidia-container

pkgver=1.3.1
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
sha256sums=('a56a2cc2d506bb43e57e58c41e37c5873c4151f6c2513bc499f28569393220a2'
            '4c5dea24ee16a0d9e9f2081004acb9a800f0de84f3b42574f740e664b6ff99e1')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/lib"
  cp -a usr/lib64/* "$pkgdir/usr/lib/"
  install -D -m644 usr/include/nvc.h "$pkgdir/usr/include/nvc.h"
}
