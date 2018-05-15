# Maintainer: Max Zhao <alcasa.mz@gmail.com>
pkgname=kube-spawn
pkgver=0.2.1
pkgrel=1
pkgdesc="A tool for creating multi-node Kubernetes clusters on a Linux machine using kubeadm & systemd-nspawn. Brought to you by the Kinvolk team. https://kinvolk.io"
arch=("any")
url="https://github.com/kinvolk/kube-spawn"
license=('Apache')
depends=("cni-plugins")
makedepends=("docker")
source=(
"https://github.com/kinvolk/$pkgname/archive/v$pkgver.tar.gz"
)
md5sums=('7c42f8c0ae240efabaf5f6ecf95721e1')

build() {
	cd "$pkgname-$pkgver"
	make DOCKERIZED=y
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make PREFIX=$pkgdir/usr install
}
