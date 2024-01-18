# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-bin
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=52.1.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')

sha256sums_x86_64=('1509294766aff85debe235918557050d4e63641723f2251fffda23ef9983fca9')
sha256sums_aarch64=('8f13a9b0fe12e34083c22f75c7ef13a75a59d4e0256941aab57d28ea2737c1d9')

source_x86_64=(
    "https://github.com/kubeshark/kubeshark/releases/download/v${pkgver}/kubeshark_${pkgver}_linux_amd64.tar.gz"
)
source_aarch64=(
    "https://github.com/kubeshark/kubeshark/releases/download/v${pkgver}/kubeshark_${pkgver}_linux_arm64.tar.gz"
)

package() {
    install -D -m0755 "${srcdir}/kubeshark" "${pkgdir}/usr/bin/kubeshark"

    "${pkgdir}/usr/bin/kubeshark" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeshark"
    "${pkgdir}/usr/bin/kubeshark" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeshark"
}
