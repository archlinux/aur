# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-bin
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=41.3
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')

sha256sums_x86_64=(
    9f93bdd3779c8c809e5614f859c3f7e3c122101322f503b45551762905796526
)
sha256sums_aarch64=(
    e1547b68071603b6f308f2dd5098624e2283a4054d474841b77cf2d9cbff03ef
)

source_x86_64=(
    "kubeshark::https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_amd64"
)
source_aarch64=(
    "kubeshark::https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_arm64"
)

package() {
    install -D -m0755 "${srcdir}/kubeshark" "${pkgdir}/usr/bin/kubeshark"

    "${pkgdir}/usr/bin/kubeshark" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeshark"
    "${pkgdir}/usr/bin/kubeshark" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeshark"
}
