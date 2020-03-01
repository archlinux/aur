# Maintainer: Muhkoenig

pkgname=kubebuilder-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="SDK for building Kubernetes APIs using CRDs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('Apache')
arch=('x86_64')
optdepends=(
  'dep'
  'kustomize'
)
provides=('kubebuilder')
conflicts=('kubebuilder')
source=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a8ffea619f8d6e6c9fab2df8543cf0912420568e3979f44340a7613de5944141')

package() {
	for file in kubebuilder_"${pkgver}"_linux_amd64/bin/*
	do
		install -Dm755 "${file}" "${pkgdir}/usr/local/kubebuilder/bin/$(basename ${file})"
	done
}
