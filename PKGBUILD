pkgname=nvidia-container-runtime
pkgver=1.1.0+1.docker17.09.0
pkgrel=1
pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('custom')
depends=(libseccomp libnvidia-container-tools)
source_x86_64=("https://nvidia.github.io/nvidia-container-runtime/centos7/x86_64/${pkgname}-1.1.0-1.docker17.09.0.x86_64.rpm")
sha256sums_x86_64=('1a5529d78f9e3abcf43f432b9bbbf83f010ac4cdd485b5a02e9288f0e4d104a5')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 "etc/${pkgname}/config.toml" "$pkgdir/etc/${pkgname}/config.toml"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
