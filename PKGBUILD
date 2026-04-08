# Maintainer: LekkerKofi

pkgname=flux-operator-bin
pkgver=0.46.0
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

sha256sums_x86_64=('1bec616c6433499662f98a9e5571ab0107380e371bb3251ae92e631f5247595c')
sha256sums_aarch64=('42d686b955ab5b5ed23654394586b21aa0d281857e2c838154d8ad6f32df6d19')

package() {
  install -vDm755 -t "$pkgdir/usr/bin"  flux-operator

  ./flux-operator completion bash | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/flux-operator"
  ./flux-operator completion fish | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/flux-operator.fish"
  ./flux-operator completion zsh | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_flux-operator"
}
