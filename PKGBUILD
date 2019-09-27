# Maintainer: Muhkoenig

pkgname=kubebuilder-bin
pkgver=2.0.1
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
sha256sums=('e8d287535c79013bfebcee22f748153686128926ae5992f023725e7b17996a04')

package() {
	for file in kubebuilder_"${pkgver}"_linux_amd64/bin/*
	do
		install -Dm755 "${file}" "${pkgdir}/usr/local/kubebuilder/bin/$(basename ${file})"
	done
}
