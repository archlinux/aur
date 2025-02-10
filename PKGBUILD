# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname="argocd-autopilot-bin"
pkgver=0.4.18
pkgrel="1"
pkgdesc="Argo-CD Autopilot is a tool which offers an opinionated way of installing Argo-CD and managing GitOps repositories"
arch=(x86_64)
url="https://github.com/argoproj-labs/argocd-autopilot"
license=('Apache')
source=(https://github.com/argoproj-labs/argocd-autopilot/releases/download/v${pkgver}/argocd-autopilot-linux-amd64.tar.gz)
depends=()
provides=('argocd-autopilot')
sha256sums=('9510f83118096487797ebeec0462230847e575de23c714fb07ce8cdbe306b9b4')

package() {
	install -Dm0755 "argocd-autopilot-linux-amd64" "$pkgdir/usr/bin/argocd-autopilot"

	$pkgdir/usr/bin/argocd-autopilot completion bash > completion
	install -Dm755 completion "$pkgdir/usr/share/bash-completion/completions/argocd-autopilot"

	$pkgdir/usr/bin/argocd-autopilot completion bash > completion
	install -Dm755 completion "$pkgdir/usr/share/fish/vendor_completions.d/argocd-autopilot.fish"

	$pkgdir/usr/bin/argocd-autopilot completion bash > completion
	install -Dm755 completion "$pkgdir/usr/share/zsh/site-functions/_argocd-autopilot"
}
