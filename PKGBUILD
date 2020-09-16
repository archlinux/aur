# Maintainer: Simon Weald <simon[at]simonweald[dot]com>
# Maintainer: Lukas Grossar <lukas[dot]grossar[at]gmail[dot]com>

pkgname=kind-bin
pkgdesc="Kubernetes IN Docker - local clusters for testing Kubernetes"
pkgver=0.9.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kind"
license=('Apache')
provides=('kind')
conflicts=('kind')
_binary=kind-linux-amd64
source=("$_binary-$pkgver::https://github.com/kubernetes-sigs/kind/releases/download/v$pkgver/$_binary")
sha256sums=('35a640e0ca479192d86a51b6fd31c657403d2cf7338368d62223938771500dc8')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/kind"

  "$pkgdir/usr/bin/kind" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kind"
  "$pkgdir/usr/bin/kind" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kind"
}
