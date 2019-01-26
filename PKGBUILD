# Maintainer: Muhkoenig

pkgname=kubebuilder-bin
pkgver=1.0.8
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
sha256sums=('7dfaf7a38d69c77f046e85aeabfe96f7cdd88634feab3ecc0bb03f9da7e69ad3')

package() {
	for file in kubebuilder_"${pkgver}"_linux_amd64/bin/*
	do
		install -Dm755 "${file}" "${pkgdir}/usr/local/kubebuilder/bin/$(basename ${file})"
	done
}
