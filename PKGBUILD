pkgname=nvidia-container-runtime-hook
pkgver=1.2.1+1
pkgrel=1
pkgdesc='NVIDIA container runtime hook'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('custom')
depends=(libnvidia-container-tools)
source_x86_64=("https://nvidia.github.io/nvidia-container-runtime/centos7/x86_64/${pkgname}-1.2.1-1.x86_64.rpm")
sha256sums_x86_64=('ccc892ec7dbbcc4b08136ccdfcef951bfe616a941a9a166261c975578f69ffc7')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 "etc/nvidia-container-runtime/config.toml" "$pkgdir/etc/nvidia-container-runtim/config.toml"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
