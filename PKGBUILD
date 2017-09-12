pkgname=nvidia-docker2
pkgver=2.0.0+docker17.06.1.ce
pkgrel=1
pkgdesc='nvidia-docker CLI wrapper'
arch=('any')
url='https://github.com/NVIDIA/nvidia-docker'
license=('custom')
depends=(docker nvidia-container-runtime)
conflicts=(nvidia-docker)
install=${pkgname}.install
source=("https://packages.nvidia.com/compute/container/packages/el/7/${pkgname}-2.0.0-1.docker17.06.1.ce.noarch.rpm/download")
sha256sums=('75a54bbc9627df44e3e0e25bf344d2fd16b07b2500441bf34799edc201602ce1')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/nvidia-docker "$pkgdir/usr/bin/"
  install -D -m644 etc/docker/daemon.json "$pkgdir/etc/docker/daemon.json"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
