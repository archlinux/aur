# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=nvidia-container-runtime-bin
_pkgname=nvidia-container-runtime

pkgver=2.0.0+3.docker18.09.6

pkgrel=1
pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('BSD')

depends=('libseccomp' 'nvidia-container-runtime-hook')
provides=('nvidia-container-runtime=2.0.0+3.docker18.09.6')
conflicts=('nvidia-container-runtime')

source=("https://nvidia.github.io/nvidia-container-runtime/centos7/$CARCH/${_pkgname}-2.0.0-3.docker18.09.6.$CARCH.rpm")
sha256sums=('1d23d648709a12f3245f138129e24837fb978c5ef75f51bce17c3c5a9d40d1ab')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 usr/share/licenses/${_pkgname}-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
