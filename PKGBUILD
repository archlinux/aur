# Maintainer: LekkerKofi

pkgname=flux-operator-bin
pkgver=0.45.1
pkgrel=1
pkgdesc="GitOps on Autopilot Mode"
arch=('x86_64' 'aarch64')
url="https://fluxoperator.dev"
license=('AGPL-3.0-only')
options=(!debug)
conflicts=('flux-operator')
provides=('flux-operator')

source_x86_64=("https://github.com/controlplaneio-fluxcd/flux-operator/releases/download/v${pkgver}/flux-operator_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/controlplaneio-fluxcd/flux-operator/releases/download/v${pkgver}/flux-operator_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('2662ab8ffbf067317573278a6e2b03cce79f68840119bf5817d01e17b2814624')
sha256sums_aarch64=('e9a6e58f4b3d3bf9feefc834edd5555627db5acde8b8d177176914e69860f464')

package() {
  install -vDm755 -t "$pkgdir/usr/bin"  flux-operator

  ./flux-operator completion bash | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/flux-operator"
  ./flux-operator completion fish | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/flux-operator.fish"
  ./flux-operator completion zsh | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_flux-operator"
}
