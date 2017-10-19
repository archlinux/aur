pkgname=nvidia-docker2
pkgver=2.0.0+1.docker17.09.0.ce
pkgrel=1
pkgdesc='nvidia-docker CLI wrapper'
arch=('any')
url='https://github.com/NVIDIA/nvidia-docker'
license=('custom')
depends=(docker nvidia-container-runtime)
conflicts=(nvidia-docker)
install=${pkgname}.install
source=("https://nvidia.github.io/nvidia-docker/centos7/x86_64/${pkgname}-2.0.0-1.docker17.09.0.ce.noarch.rpm")
sha256sums=('e984c2b16571e261946dd7d3ea0b0ec2d3a1c3ec017498035270ae7376f10222')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/nvidia-docker "$pkgdir/usr/bin/"
  install -D -m644 etc/docker/daemon.json "$pkgdir/etc/docker/daemon.json"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
