# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=nvidia-container-runtime-bin
_pkgname=nvidia-container-runtime

pkgver=3.1.3
pkgrel=1

pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('BSD')

depends=('libseccomp' 'nvidia-container-toolkit<2.0.0')
provides=('nvidia-container-runtime=3.1.2')
conflicts=('nvidia-container-runtime')

source=("https://nvidia.github.io/nvidia-container-runtime/centos7/$CARCH/${_pkgname}-${pkgver}-1.$CARCH.rpm")
sha256sums=('8ea2735941bfe64db318504d46cb0cfbce4a8cbcb68d2ef11c9de149dedc764b')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 usr/share/licenses/${_pkgname}-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
