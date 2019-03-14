# Maintainer: kiendang and Joel Shapiro (jshapiro <a> nvidia)

pkgname=nvidia-container-runtime-bin
_pkgname=nvidia-container-runtime

pkgver=2.0.0

pkgrel=1
pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('BSD')

depends=('libseccomp' 'nvidia-container-runtime-hook')
provides=('nvidia-container-runtime')
conflicts=('nvidia-container-runtime')

source=("https://nvidia.github.io/nvidia-container-runtime/centos7/$CARCH/${_pkgname}-2.0.0-1.docker18.09.3.$CARCH.rpm")
sha256sums=('baa919c98282f9a722ef51f987d5d672941f8e68337e582cebfcb0606812eb68')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 usr/share/licenses/${_pkgname}-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
