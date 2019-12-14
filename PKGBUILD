# Maintainer: Muhkoenig

pkgname=kubebuilder-bin
pkgver=2.2.0
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
sha256sums=('9ef35a4a4e92408f7606f1dd1e68fe986fa222a88d34e40ecc07b6ffffcc8c12')

package() {
	for file in kubebuilder_"${pkgver}"_linux_amd64/bin/*
	do
		install -Dm755 "${file}" "${pkgdir}/usr/local/kubebuilder/bin/$(basename ${file})"
	done
}
