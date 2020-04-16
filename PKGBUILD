# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=argocd-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("argocd_$pkgver::https://github.com/argoproj/argo-cd/releases/download/v$pkgver/argocd-linux-amd64")
sha256sums=('b50607f3f81347cc25ba7812fa1cbeaaa5ff0e29ce71da8f4ed474200be867b9')

package() {
  install -Dm755 "argocd_$pkgver" "$pkgdir/usr/bin/argocd"
  "$pkgdir/usr/bin/argocd" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/argocd"
  "$pkgdir/usr/bin/argocd" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_argocd"	
}
