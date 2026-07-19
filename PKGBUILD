# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.linkerd-edge-recommended-bin

pkgname=linkerd-edge-recommended-bin
pkgver=26.5.1
pkgrel=1
pkgdesc="Ultralight, security-first service mesh for Kubernetes. Recommended edge release."
arch=('x86_64' 'aarch64')
url="https://linkerd.io/"
license=('Apache')
depends=('glibc')
options=('!debug' '!strip')
provides=('linkerd')
conflicts=('linkerd-bin' 'linkerd-edge-bin')

source_x86_64=("linkerd-${pkgver}-x86_64::https://github.com/linkerd/linkerd2/releases/download/edge-${pkgver}/linkerd2-cli-edge-${pkgver}-linux-amd64")
source_aarch64=("linkerd-${pkgver}-aarch64::https://github.com/linkerd/linkerd2/releases/download/edge-${pkgver}/linkerd2-cli-edge-${pkgver}-linux-arm64")

sha256sums_x86_64=('0fdc998cdfba824b22562ccdfa9d4c0d1d7b129c42e4c6ad05c5ad8a3f2e6906')
sha256sums_aarch64=('a8c325ed560ba6aa9c97c9008c255fb514027cd90bccc9905ee66ee620ead021')

package() {
    install -Dm755 linkerd-${pkgver}-${arch} "${pkgdir}/usr/bin/linkerd"
}
