# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubebuilder-bin
pkgdesc="SDK for building Kubernetes APIs"
pkgver=4.15.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('apache')
conflicts=('kubebuilder')
provides=('kubebuilder')

sha256sums_x86_64=('9632ba818c35e10d9664f19090972ee5d667bdffbf4b83c34e8374c5e846afa2')
sha256sums_aarch64=('9632ba818c35e10d9664f19090972ee5d667bdffbf4b83c34e8374c5e846afa2')

source_x86_64=(
    "kubebuilder-$pkgver::https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64"
)
source_aarch64=(
    "kubebuilder-$pkgver::https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_arm64"
)

package() {
    install -Dm755 "${srcdir}/kubebuilder-$pkgver" "${pkgdir}/usr/bin/kubebuilder"

    "${pkgdir}/usr/bin/kubebuilder" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubebuilder"
    "${pkgdir}/usr/bin/kubebuilder" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubebuilder"
}
