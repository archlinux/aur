# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=libnvidia-container-bin
_pkgname=libnvidia-container

pkgver=1.2.0
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
sha256sums=('3fa63bf811eacd4454692035bf75594c95582f550865a3dd19e89f968faff1e9'
            'a818887b3163ff768f3db1a1fb4422414d2b846473c8ee42c67a416e7502c946')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/lib"
  cp -a usr/lib64/* "$pkgdir/usr/lib/"
  install -D -m644 usr/include/nvc.h "$pkgdir/usr/include/nvc.h"
}
