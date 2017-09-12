pkgname=nvidia-container-runtime
pkgver=1.0.0+docker17.06.1
pkgrel=1
pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('custom')
depends=(libseccomp libnvidia-container-tools)
source_x86_64=("https://packages.nvidia.com/compute/container/packages/el/7/${pkgname}-1.0.0-1.docker17.06.1.x86_64.rpm/download")
sha256sums_x86_64=('59595be458106a9f49055897c59ee15385b123c8104efa26d9cd4cb151dff034')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 "etc/${pkgname}/config.toml" "$pkgdir/etc/${pkgname}/config.toml"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
