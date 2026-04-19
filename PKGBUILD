# Maintainer: LekkerKofi

pkgname=flux-operator-bin
pkgver=0.47.0
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

sha256sums_x86_64=('d7cb3a5cb576337738e45137f6bae525b5e48d3581042dad8618cb7d0fb0c642')
sha256sums_aarch64=('db829fdbe19304c84538ca099f0ed8ad90a86e1cb5060f36696d9a9d893d6afc')

package() {
  install -vDm755 -t "$pkgdir/usr/bin"  flux-operator

  ./flux-operator completion bash | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/flux-operator"
  ./flux-operator completion fish | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/flux-operator.fish"
  ./flux-operator completion zsh | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_flux-operator"
}
