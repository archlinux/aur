# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=nvidia-container-runtime-bin
_pkgname=nvidia-container-runtime

pkgver=3.3.0

pkgrel=1
pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('BSD')

depends=('libseccomp' 'nvidia-container-toolkit<2.0.0')
provides=('nvidia-container-runtime=3.2.0')
conflicts=('nvidia-container-runtime')

source=("https://nvidia.github.io/nvidia-container-runtime/centos7/$CARCH/${_pkgname}-${pkgver}-1.$CARCH.rpm")
sha256sums=('d40c5b07d3c882238a05428407e062196f77c57a6f151d87da28cb3d1255f6f0')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 usr/share/licenses/${_pkgname}-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
