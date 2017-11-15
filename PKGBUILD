pkgname=nvidia-docker2
pkgver=2.0.1+1.docker17.09.0.ce
pkgrel=1
pkgdesc='nvidia-docker CLI wrapper'
arch=('any')
url='https://github.com/NVIDIA/nvidia-docker'
license=('custom')
depends=(docker nvidia-container-runtime)
conflicts=(nvidia-docker)
install=${pkgname}.install
source=("https://nvidia.github.io/nvidia-docker/centos7/x86_64/${pkgname}-2.0.1-1.docker17.09.0.ce.noarch.rpm")
sha256sums=('74fb689a78e326cafda6e9d35b9d956e33acc8fa3835d355f74a5b2222068a19')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/nvidia-docker "$pkgdir/usr/bin/"
  install -D -m644 etc/docker/daemon.json "$pkgdir/etc/docker/daemon.json"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
