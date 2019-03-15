# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=nvidia-container-runtime-hook-bin
_pkgname=nvidia-container-runtime-hook

pkgver=1.4.0

pkgrel=1
pkgdesc='NVIDIA container runtime hook'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('BSD')

depends=('libnvidia-container-tools')
provides=('nvidia-container-runtime-hook')
conflicts=('nvidia-container-runtime-hook')

source=("https://nvidia.github.io/nvidia-container-runtime/centos7/$CARCH/${_pkgname}-1.4.0-2.$CARCH.rpm")
sha256sums=('8d3f6acd6a498c4fd9a2fb5a862536a9c6f3f3839885b358df6d89aaad78a3df')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 "etc/nvidia-container-runtime/config.toml" "$pkgdir/etc/nvidia-container-runtime/config.toml"
  install -D -m644 usr/share/licenses/${_pkgname}-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
