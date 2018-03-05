pkgname=nvidia-docker2
pkgver=2.0.3+1.docker17.12.1.ce
pkgrel=1
pkgdesc='nvidia-docker CLI wrapper'
arch=('any')
url='https://github.com/NVIDIA/nvidia-docker'
license=('custom')
depends=(docker nvidia-container-runtime-hook)
conflicts=(nvidia-docker)
install=${pkgname}.install
source=("https://nvidia.github.io/nvidia-docker/centos7/x86_64/${pkgname}-2.0.3-1.docker17.12.1.ce.noarch.rpm")
sha256sums=('99d6a0b2286e5b8f15764fb1ed64def6b803e4f1ff50e582c4bec0a733d17e1c')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/nvidia-docker "$pkgdir/usr/bin/"
  install -D -m644 etc/docker/daemon.json "$pkgdir/etc/docker/daemon.json"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
