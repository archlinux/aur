# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=docker-machine-driver-kvm2
pkgver=1.26.0
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
b2sums=('41ea5a1f95e2111466539a372581d6bd2abe37ea43481f9c134826c143dfafb3eb8d69d771f33e8912dbb1a424a86a2dc206ecb97c3a186dece63fc643752174')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
