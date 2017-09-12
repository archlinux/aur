pkgname=libnvidia-container
pkgver=1.0.0_0.1.alpha.1
pkgrel=1
pkgdesc='NVIDIA container runtime library'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('custom')
depends=(libcap libseccomp)
source_x86_64=("https://packages.nvidia.com/compute/container/packages/el/7/libnvidia-container1-1.0.0-0.1.alpha.1.x86_64.rpm/download")
sha256sums_x86_64=('53dc4503944242b3534aadf0cbd8c09a3f3385d9da7e49633407f0b22d081c95')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/lib"
  cp -a usr/lib64/* "$pkgdir/usr/lib/"
  install -D -m644 usr/share/licenses/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
