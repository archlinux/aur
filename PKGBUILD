# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=argocd-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("argocd_$pkgver::https://github.com/argoproj/argo-cd/releases/download/v$pkgver/argocd-linux-amd64")
sha256sums=('cbb5fc0f2ad0a37e12260b27c2333f9f3be9394f4e7df6504c4d33316c7c215a')

package() {
  install -Dm755 "argocd_$pkgver" "$pkgdir/usr/bin/argocd"
  "$pkgdir/usr/bin/argocd" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/argocd"
  "$pkgdir/usr/bin/argocd" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_argocd"	
}
