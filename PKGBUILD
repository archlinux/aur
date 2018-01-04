pkgname=nvidia-container-runtime
pkgver=1.1.1+1.docker17.12.0
pkgrel=1
pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('custom')
depends=(libseccomp libnvidia-container-tools)
source_x86_64=("https://nvidia.github.io/nvidia-container-runtime/centos7/x86_64/${pkgname}-1.1.1-1.docker17.12.0.x86_64.rpm")
sha256sums_x86_64=('6c9a26c448365386bad9f0cabdf45cf497dff32b3fa8f63ab78078a63f8d4ab4')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 "etc/${pkgname}/config.toml" "$pkgdir/etc/${pkgname}/config.toml"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
