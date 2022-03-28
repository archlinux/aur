# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=docker-machine-driver-kvm2
pkgver=1.25.2
pkgrel=1
pkgdesc='Minikube-maintained KVM driver for docker-machine'
url='https://minikube.sigs.k8s.io'
license=('Apache')
arch=('x86_64')
_goarch='amd64'
depends=(
	'dnsmasq'
	'docker-machine'
	'iptables-nft'
	'libvirt'
	'qemu-headless'
)
optdepends=('docker: to manage containers in the machine')
source=("${pkgname}-${pkgver}"::"https://storage.googleapis.com/minikube/releases/v${pkgver}/${pkgname}-${_goarch}")
b2sums=('4e0ab7550d2b8fdf844d58028c58aedfd93defd4c95b5dc6f995863ca833f41dad1823ef22020a82c84f028d28f60913657a758dd08ba1dacd218d54702d8e06')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
