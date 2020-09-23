# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=nvidia-container-runtime-bin
_pkgname=nvidia-container-runtime

pkgver=3.4.0

pkgrel=1
pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('BSD')

depends=('libseccomp' 'nvidia-container-toolkit>=1.3.0')
provides=('nvidia-container-runtime=3.4.0')
conflicts=('nvidia-container-runtime')

source=("https://nvidia.github.io/nvidia-container-runtime/centos7/$CARCH/${_pkgname}-${pkgver}-1.$CARCH.rpm")
sha256sums=('a402c9592f9e61630f9b1b6e99a92a0224bf37d1759f949fe8d17fc24d6aa394')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 usr/share/licenses/${_pkgname}-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
