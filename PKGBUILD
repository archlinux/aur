# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubebuilder-bin
pkgdesc="SDK for building Kubernetes APIs"
pkgver=4.16.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('apache')
conflicts=('kubebuilder')
provides=('kubebuilder')

sha256sums_x86_64=('539984e58832044f2326b1bb940c1eaf784f1849e65d06d3a4a4a8b5dfac7ca7')
sha256sums_aarch64=('539984e58832044f2326b1bb940c1eaf784f1849e65d06d3a4a4a8b5dfac7ca7')

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
