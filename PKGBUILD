pkgname=libnvidia-container-bin
_pkgname=libnvidia-container
pkgver=1.0.1
pkgrel=1
pkgdesc='NVIDIA container runtime library'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('custom')
depends=('libcap' 'libseccomp')
provides=('libnvidia-container')
conflicts=('libnvidia-container')
source=("https://nvidia.github.io/libnvidia-container/centos7/x86_64/${_pkgname}1-1.0.1-1.x86_64.rpm")
sha256sums=('bb422721c5c66be35e75bdad1bbe14d29529ea2e3fb30744f04b28e3b02d6ef9')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/lib"
  cp -a usr/lib64/* "$pkgdir/usr/lib/"
  install -D -m644 usr/share/licenses/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
