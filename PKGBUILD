# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubebuilder-bin
pkgdesc="SDK for building Kubernetes APIs"
pkgver=3.14.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('apache')
conflicts=('kubebuilder')
provides=('kubebuilder')

sha256sums_x86_64=(
    '702dce3c115f78a5c3e7372787a2894ab80cb6f2c7bd66fd83cbc88c79bc8768'
)
sha256sums_aarch64=(
    '441a0e3023024e3b97c92f7f76cd1b926da0f01b32c909ed8df83579410ae5ee'
)

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
