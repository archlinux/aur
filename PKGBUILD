# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=libnvidia-container-bin
_pkgname=libnvidia-container

pkgver=1.3.0
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
sha256sums=('4c44c54ec893a45429cae865e2d255ff0b3a5d700fde797ac5f8699f007298c4'
            '0256da411c3b2246a27aad02f190ebabe40dc59437f4f7fdb99cd79ffecb606e')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/lib"
  cp -a usr/lib64/* "$pkgdir/usr/lib/"
  install -D -m644 usr/include/nvc.h "$pkgdir/usr/include/nvc.h"
}
