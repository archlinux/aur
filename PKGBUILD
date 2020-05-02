# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=argocd-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("argocd_$pkgver::https://github.com/argoproj/argo-cd/releases/download/v$pkgver/argocd-linux-amd64")
sha256sums=('bf038fba5984c3315a4d0371188014e31b2d41552bd830d24214a6a6d95db1fc')

package() {
  install -Dm755 "argocd_$pkgver" "$pkgdir/usr/bin/argocd"
  "$pkgdir/usr/bin/argocd" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/argocd"
  "$pkgdir/usr/bin/argocd" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_argocd"	
}
