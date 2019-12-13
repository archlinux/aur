# Maintainer: Brad Erhart <brae.04+aur@gmail.com> 

pkgname=docker-machine-driver-kvm2
pkgver=1.6.1
pkgrel=1
pkgdesc="Minikube-maintained KVM driver for docker-machine"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
depends=(
	'docker-machine'
	'libvirt'
	'iptables'
	'dnsmasq'
)
optdepends=('docker: to manage the containers in the machine')
source=("${pkgname}_${pkgver}::https://github.com/kubernetes/minikube/releases/download/v$pkgver/$pkgname")
sha256sums=('5dc0cc5a73304c7ee0263aee2d1d3e296738154389e0a7bac82009194527f505')

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/bin"
	install -m755 "$pkgname_$pkgver" "$pkgdir/usr/bin/$pkgname"
}
