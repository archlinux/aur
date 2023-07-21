# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubebuilder-bin
pkgdesc="SDK for building Kubernetes APIs"
pkgver=3.11.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('apache')
conflicts=('kubebuilder')
provides=('kubebuilder')

sha256sums_x86_64=(
    'ca8dac24944ca97d6deecada35ef301b3cf67ec4bc25a5cdeccf38eaa7495285'
)
sha256sums_aarch64=(
    '213e821514dd3221e8a8bb8b45da049b7fd7b089ad4e24aaf56288b8f2637dc4'
)

source_x86_64=(
    "kubebuilder::https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_amd64"
)
source_aarch64=(
    "kubebuilder::https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_linux_arm64"
)

package() {
    install -Dm755 "${srcdir}/kubebuilder" "${pkgdir}/usr/bin/kubebuilder"

    "${pkgdir}/usr/bin/kubebuilder" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubebuilder"
    "${pkgdir}/usr/bin/kubebuilder" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubebuilder"
}
