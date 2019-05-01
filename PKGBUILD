# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=libnvidia-container-bin
_pkgname=libnvidia-container

pkgver=1.0.2
pkgrel=1

pkgdesc='NVIDIA container runtime library'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('BSD')

depends=('libcap' 'libseccomp')
provides=('libnvidia-container=1.0.2')
conflicts=('libnvidia-container')

source=("https://nvidia.github.io/libnvidia-container/centos7/$CARCH/${_pkgname}1-${pkgver}-1.$CARCH.rpm"
        "https://nvidia.github.io/libnvidia-container/centos7/$CARCH/${_pkgname}-devel-${pkgver}-1.$CARCH.rpm")
sha256sums=('896937e0df4b762a2c6cbcc6ff03f42ac400811ebb8639313ad7d743f624ee49'
            'aee617ffd33eb167479d30d072a75399a9562877b4474f605feac48fe9eb8c77')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/lib"
  cp -a usr/lib64/* "$pkgdir/usr/lib/"
  install -D -m644 usr/include/nvc.h "$pkgdir/usr/include/nvc.h"
  install -D -m644 usr/share/licenses/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
