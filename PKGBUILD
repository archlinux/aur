# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=argocd-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("argocd_$pkgver::https://github.com/argoproj/argo-cd/releases/download/v$pkgver/argocd-linux-amd64")
sha256sums=('7b66af9f3bf654a4dd08685300ae41f1669495e53aa8d7a632979f439a16fe06')

package() {
  install -Dm755 "argocd_$pkgver" "$pkgdir/usr/bin/argocd"
  "$pkgdir/usr/bin/argocd" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/argocd"
  "$pkgdir/usr/bin/argocd" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_argocd"	
}
