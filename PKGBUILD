# Maintainer: LekkerKofi

pkgname=flux-operator-bin
pkgver=0.48.0
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

sha256sums_x86_64=('febc30806053d028f9e10f5572966ed28ede07c4912ff998936f724d1f693909')
sha256sums_aarch64=('8391fc4503f63a5b4c2e392e1a741d9c54e969e32f8a2d4c073591e03c3f0fd8')

package() {
  install -vDm755 -t "$pkgdir/usr/bin"  flux-operator

  ./flux-operator completion bash | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/flux-operator"
  ./flux-operator completion fish | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/flux-operator.fish"
  ./flux-operator completion zsh | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_flux-operator"
}
