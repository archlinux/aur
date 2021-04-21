# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=argo-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64')
url="https://github.com/argoproj/argo"
license=('Apache')
source=("argo_$pkgver.gz::https://github.com/argoproj/argo/releases/download/v$pkgver/argo-linux-amd64.gz")

package() {
  install -Dm755 "argo_$pkgver" "$pkgdir/usr/bin/argo"
  $pkgdir/usr/bin/argo completion zsh > argo.zsh
  $pkgdir/usr/bin/argo completion bash > argo.bash
  install -Dm644 argo.zsh "$pkgdir/usr/share/zsh/site-functions/_argo"
  install -Dm644 argo.bash "$pkgdir/usr/share/bash-completion/completions/argo"
}

md5sums=('67b66d0693ca6244caa3d15135a38197')
