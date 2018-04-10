pkgname=nvidia-docker2
pkgver=2.0.3+1.docker18.03.0.ce
pkgrel=1
pkgdesc='nvidia-docker CLI wrapper'
arch=('any')
url='https://github.com/NVIDIA/nvidia-docker'
license=('custom')
depends=(docker nvidia-container-runtime-hook)
conflicts=(nvidia-docker)
install=${pkgname}.install
source=("https://nvidia.github.io/nvidia-docker/centos7/x86_64/${pkgname}-2.0.3-1.docker18.03.0.ce.noarch.rpm")
sha256sums=('b446d10bb94fe727dd8d51b1e1a2314fed52b620f077b03c9c6f519c54e47152')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/nvidia-docker "$pkgdir/usr/bin/"
  install -D -m644 etc/docker/daemon.json "$pkgdir/etc/docker/daemon.json"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
