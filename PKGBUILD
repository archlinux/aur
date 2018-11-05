# Maintainer: Muhkoenig

pkgname=kubebuilder-bin
pkgver=1.0.5
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
sha256sums=('e729c74f6a1b3ab9c416642f372b84df60d07c84f64302f1f7e3fe7a9f9411e5')

package() {
	for file in kubebuilder_"${pkgver}"_linux_amd64/bin/*
	do
		install -Dm755 "${file}" "${pkgdir}/usr/local/kubebuilder/bin/$(basename ${file})"
	done
}
