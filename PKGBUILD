# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.8.2
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('9569824dff29be85b4fd7987de0e5b69f067307ec8dd643e5182b71f3ff27910393290619eb79fa7fc90b208c9ba93d58e66255a921acacf28d90823ef409e2a')
sha512sums_x86_64=('fc5aca09c6793006e13668f4ba0b4d3fb6d18bba9b98a9b2a082ae73d2997344ae8c3a4d0d3fff3d0565f19f65d33263ffd7248146cf338a1c3894085b9b16d0')

package() {
  cd "$srcdir"
  install -Dm 755 linux-*/helm "$pkgdir/usr/bin/helm"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_helm"
}
