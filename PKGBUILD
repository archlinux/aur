# Maintainer: LekkerKofi

pkgname=flux-operator-bin
pkgver=0.50.0
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

sha256sums_x86_64=('2b61e351a86de43bf028d1da88e15902f171649e4453e253a6f26cea1ad4aa2b')
sha256sums_aarch64=('12f4b1d44cbc7792eaba6682fab0bd39765db8fefc4eeb57c5c4c15c95b23637')

package() {
  install -vDm755 -t "$pkgdir/usr/bin"  flux-operator

  ./flux-operator completion bash | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/flux-operator"
  ./flux-operator completion fish | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/flux-operator.fish"
  ./flux-operator completion zsh | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_flux-operator"
}
